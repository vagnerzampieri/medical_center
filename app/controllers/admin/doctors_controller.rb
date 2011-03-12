class Admin::DoctorsController < ApplicationController
  layout 'admin/application'
	respond_to :html, :xml, :js
	
  def index
    @doctors = Doctor.order 'name ASC'
    
    respond_with @doctors
  end
  
  def new
    @doctor = Doctor.new
    @specialties = Specialty.order 'name ASC'
    @states = State.order 'name ASC'
    @health_plans = HealthPlan.where('id > 1').order('name ASC')
    
    respond_with @doctor
  end
  
  def create
    @doctor = Doctor.new params[:doctor]
    
    respond_to do |format|
      if @doctor.save
        @doctor.save_doctor_specialties params[:specialty]
        @doctor.save_doctor_health_plans params[:health_plan]
        @doctor.save_users 
        
        format.html { redirect_to(admin_doctors_url, :notice => 'Doctor was successfully created.') }
        format.xml  { render :xml => @doctor, :status => :created, :location => @doctor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doctor.errors, :status => :unprocessable_entity }
      end
    end
    
  end
  
  def show
    @doctor = Doctor.find params[:id]
    
    respond_with @doctor
  end
  
  def edit
    @doctor = Doctor.find params[:id]
    @specialties = Specialty.order 'name ASC'
    @states = State.order 'name ASC'
    @health_plans = HealthPlan.where('id > 1').order('name ASC')
    
    respond_with @doctor
  end

  def update
    @doctor = Doctor.find params[:id]
    
    specialty_clean = "DELETE FROM doctor_specialties WHERE servant_id = #{@doctor.id}"
    ActiveRecord::Base::connection().update(specialty_clean)

    @doctor.save_doctor_specialties params[:specialty]
        
    
    health_plan_clean = "DELETE FROM doctor_health_plans WHERE servant_id = #{@doctor.id}"
    ActiveRecord::Base::connection().update(health_plan_clean)

    @doctor.save_doctor_health_plans params[:health_plan]

    respond_to do |format|
      if @doctor.update_attributes(params[:doctor])        
        format.html { redirect_to(admin_doctors_url, :notice => 'Doctor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doctor.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  def destroy
    @doctor = Doctor.find(params[:id]).destroy
		
    respond_to do |format|
      format.html { redirect_to(admin_doctors_url) }
      format.xml  { head :ok }
    end
  end
  
  def enable
    @doctor = Doctor.find params[:id]
    @doctor.enabled = (@doctor.enabled) ? false : true

    if @doctor.save
      flash[:success] = (@doctor.enabled) ? I18n.t(:doctor_enabled) : I18n.t(:doctor_disabled)
    else
      flash[:error] = I18n.t(:doctor_enable_error)
    end
    
    redirect_to admin_doctors_path
    
  end

  
end
