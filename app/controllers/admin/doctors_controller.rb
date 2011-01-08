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
    
    #terminar
    #puts "params =================== #{params[:specialty]}"
    
    respond_to do |format|
      if @doctor.save
        format.html { redirect_to(admin_patients_url, :notice => 'Patient was successfully created.') }
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
    
    #terminar
    #puts "params =================== #{params[:specialty]}"

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
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
		
    respond_to do |format|
      format.html { redirect_to(admin_doctors_url) }
      format.xml  { head :ok }
    end
  end
  
  def enable
    @doctor = Doctor.find(params[:id])
    @doctor.enabled = (@doctor.enabled) ? false : true

    if @doctor.save
      flash[:success] = (@doctor.enabled) ? I18n.t(:doctor_enabled) : I18n.t(:patient_disabled)
    else
      flash[:error] = I18n.t(:doctor_enable_error)
    end
    
    redirect_to(admin_doctors_path)
    
  end

  
end
