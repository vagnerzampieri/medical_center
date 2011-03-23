#encoding: UTF-8
class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  protect_from_forgery
  layout 'application'
  
  before_filter :check_authorization
  helper_method :has_access?
  
  def admin?
    unless user_signed_in?
      redirect_to User.can_login
    end    
  end
  
  def has_access?(authorization_path)
    check_authorization(authorization_path, redirect = false)
  end
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      "/admin/dashboard"
    end
  end
  
  def generate_cookie
    session[:access] = {
        :user_id => @current_user.id,
        :controller => controller_path,
        :action => action_name,
        :status => 1
      }
  end
  
  def check_authorization(authorization_path = nil, redirect = true)
    if user_signed_in?
      @current_user = current_user
    else
      @current_user = User.find 0
    end
    
    if @current_user.id == 1
      generate_cookie
      return true
    end
    
    required_permission = (authorization_path.nil?) ? "#{controller_path}/#{action_name}" : authorization_path
    
    if granted_actions required_permission
      return true
    end
    
    @current_user.roles.detect {|role|
      role.permissions.detect {|permission|
        user_permissions = "#{permission.controller.constantize.controller_path}/#{permission.action}"
        if user_permissions == required_permission
          generate_cookie
          return true
        end
      }
    }
    
    generate_cookie
    
    if redirect == true
      flash[:alert] = "Você não está autorizado a acessar esta página #{required_permission}."
      redirect_to("/home/action_forbidden") if authorization_path.nil?
    end
    
    return false
    
  end
    
  def granted_actions(required_permission)
    actions = [ 'home/index',
                'home/action_forbidden',
                'devise/sessions/new', 
                'devise/sessions/destroy',
                'devise/passwords/new'
              ]
    actions.each do |a|
      if required_permission == a
        return true
      end
    end
    false
  end    
  

end
