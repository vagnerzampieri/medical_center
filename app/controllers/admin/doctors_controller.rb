class Admin::DoctorsController < ApplicationController
  layout 'admin/application'
	respond_to :html, :xml
	
  def index
    @doctors = Doctor.all(:order => 'name ASC')
    
    respond_with @doctors
  end
  
  def new
    @doctor = Doctor.new
    @specialties = Specialty.all(:order => 'name ASC')
    @states = State.all(:order => 'name ASC')
    
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
  
end
