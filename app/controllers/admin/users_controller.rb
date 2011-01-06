class Admin::UsersController < ApplicationController
	layout 'admin/application'
	respond_to :html, :xml
	
	def index
		@users = User.all(:order => 'name ASC')
		
		respond_with @users
	end
	
	def new
		@user = User.new
		
		respond_with @users
	end
	
	def create
		@user = User.new(params[:user])
		
		respond_to do |format|
			if @user.save
				format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
			else
				format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
			end
		end
	end
	
	def show
		@user = User.find(params[:id])
		
		respond_with @user
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		
		respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
    
	end
	
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		
		respond_to do |format|
      format.html { redirect_to(admin_users_url) }
      format.xml  { head :ok }
    end
	end
	
	def enable
    @user = User.find(params[:id])
    @user.enabled = (@user.enabled) ? false : true

    if @user.save
      flash[:success] = (@user.enabled) ? I18n.t(:user_enabled) : I18n.t(:user_disabled)
    else
      flash[:error] = I18n.t(:user_enable_error)
    end
    
    redirect_to(admin_users_path)
    
  end
	
end
