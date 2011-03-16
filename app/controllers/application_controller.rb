#encoding: UTF-8
class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  protect_from_forgery
  layout 'application'
  
  before_filter :check_authorization
  helper_method :has_access?
  
  GUEST = 0
  DEVEL = 1
  
  def has_access?(authorization_path)
    check_authorization(authorization_path)
  end
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      "/admin/dashboard"
    end
  end
  
  private
  
  def check_authorization(authorization_path = nil)
    if user_signed_in?
      @current_user = current_user
    else
      @current_user = User.find 0
    end
    
    if @current_user.id == DEVEL
      session[:access] = {
        :user_id => @current_user.id,
        :controller => controller_path,
        :action => action_name,
        :status => 1
      }
      true
    elsif @current_user.id == GUEST
      false
    elsif @current_user.id > DEVEL
      validate_access_sytem(authorization_path)
    end
  end
  
  def validate_access_sytem(authorization_path)
    required_permission = (authorization_path.nil?) ? "#{controller_path()}/#{action_name}" : authorization_path
    granted_actions(required_permission)
    
    @current_user.roles.detect {|role|
      role.permissions.detect{|permission|
        actual_controler_action = permission.controller.constantize.controller_path + '/' + permission.action
        if actual_controler_action == required_permission
          session[:access] = {:user_id => @current_user.id,
            :controller => controller_path,
            :action => action_name,
            :status => 1
          }
          true
        else
          flash[:alert] = "Você não está autorizado a acessar esta página."
          #redirect_to "/" if authorization_path.nil? or authorization_path.empty?
          false
        end
      }
    }
    
  end
  
  def granted_actions(required_permission)
    actions = [ '/',
                'users/sign_in', 
                'users/sign_out',
                'users/password/new'
              ]
    actions.each do |a|
      if required_permission == a
        true
      end
    end
    false
  end    

end
