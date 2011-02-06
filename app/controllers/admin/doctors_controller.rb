class Admin::DoctorsController < ApplicationController
  layout 'admin/application'
	respond_to :html, :xml
	
  def index
    @doctors = Doctor.order('name ASC')
    
    respond_with @doctors
  end
  
  def new
    @doctor = Doctor.new
    @specialties = Specialty.order('name ASC')
    @states = State.order('name ASC')
    
    respond_with @doctor
  end
  
  def create
    @doctor = Doctor.new(params[:doctor])
    
    respond_to do |format|
      if @doctor.save
        specialties = params[:specialty]
        specialties.each do |index, specialty|
          unless specialty.empty? or specialty.nil?
            DoctorSpecialty.create(
              :servant_id => @doctor.id,
              :specialty_id => specialty,
              :number => index
            )
          end
        end
        
        user = User.create(
          :name => @doctor.name,
          :login => @doctor.name.mb_chars.normalize(:kd).downcase.gsub(' ', '').gsub(/\W/,''),
          :email => @doctor.email,
          :password => @doctor.name.mb_chars.normalize(:kd).downcase.gsub(' ', '').gsub(/\W/,''),
          :password_confirmation => @doctor.name.mb_chars.normalize(:kd).downcase.gsub(' ', '').gsub(/\W/,''),
          :enabled => 1,
          :can_login => 1
        )        
        
        role = Role.find 6
        user.roles << role
        user.servants << @doctor
        user.save
        
        format.html { redirect_to(admin_doctors_url, :notice => 'Doctor was successfully created.') }
        format.xml  { render :xml => @doctor, :status => :created, :location => @doctor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doctor.errors, :status => :unprocessable_entity }
      end
    end
    
  end
  
  def show
    @doctor = Doctor.find(params[:id])
    
    respond_with @doctor
  end
  
  def edit
    @doctor = Doctor.find(params[:id])
    @specialties = Specialty.order('name ASC')
    @states = State.order('name ASC')
    
    respond_with @doctor
  end

  def update
    @doctor = Doctor.find(params[:id])
    
    specialty_clean = "DELETE FROM doctor_specialties WHERE servant_id = #{@doctor.id}"
    ActiveRecord::Base::connection().update(specialty_clean)
    
    specialties = params[:specialty]
    specialties.each do |index, specialty|
      unless specialty.empty? or specialty.nil?
        DoctorSpecialty.create(
          :servant_id => @doctor.id,
          :specialty_id => specialty,
          :number => index
        )
      end
    end

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
    Doctor.find(params[:id]).destroy
		
    respond_to do |format|
      format.html { redirect_to(admin_doctors_url) }
      format.xml  { head :ok }
    end
  end
  
  def enable
    @doctor = Doctor.find(params[:id])
    @doctor.enabled = (@doctor.enabled) ? false : true

    if @doctor.save
      flash[:success] = (@doctor.enabled) ? I18n.t(:doctor_enabled) : I18n.t(:doctor_disabled)
    else
      flash[:error] = I18n.t(:doctor_enable_error)
    end
    
    redirect_to(admin_doctors_path)
    
  end

  
end
