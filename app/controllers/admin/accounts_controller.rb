class Admin::AccountsController < ApplicationController
  layout 'admin/application'
	respond_to :html, :xml, :js
	before_filter :admin?
	
	def show
		@user = User.find params[:id]
		
		respond_with @user
	end
	
	def edit
	  @user = User.find params[:id]
	  @roles = Role.where(:enabled => 1).order('name ASC')
		@selected = @user.roles[0].id unless @selected = @user.roles[0].nil?
	end
	
	def update
	  @user = User.find params[:id]
		
		role_clean = "DELETE FROM roles_users WHERE user_id = #{@user.id}"
    ActiveRecord::Base::connection().update(role_clean)
    
    @user.save_role params[:role]
    
		respond_to do |format|
      if @user.update_attributes params[:user]
        format.html { redirect_to(admin_account_url, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
	end
	
	def edit_user
	  user = User.find params[:id]
	  @role = user.roles[0].id
   
    if @role == 6
      @patient = Patient.find user.patient_id
      redirect_to edit_admin_patient_path @patient
    
    elsif @role == 5
      @nurse = Nurse.find user.servant_id
      redirect_to edit_admin_nurse_path @nurse
    
    elsif @role == 4
      @doctor = Doctor.find user.servant_id
      redirect_to edit_admin_doctor_path @doctor
    
    elsif @role == 3
      @administrative = Administrative.find user.servant_id
      redirect_to edit_admin_administrative_path @administrative
    else
      flash[:notice] = "Nao existe conta para esse usuario."
      redirect_to :back
    end
	end
	
end
