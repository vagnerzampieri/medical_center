class Admin::PatientsController < ApplicationController
	layout 'admin/application'
	respond_to :html, :xml, :js

	def index
		@patients = Patient.order 'name ASC'
		
		
		respond_with @patients
	end
	
	def new
    @patient = Patient.new
    @states = State.order 'name ASC'
    @health_plans = HealthPlan.where(:enabled => 1).order('name ASC')
    @rooms = Room.order 'name ASC'
    
    respond_with @patient
  end
	
	def create
		@patient = Patient.new params[:patient]
		
		respond_to do |format|
      if @patient.save
        @patient.save_users
        
        format.html { redirect_to(admin_patients_url, :notice => 'Patient was successfully created.') }
        format.xml  { render :xml => @patient, :status => :created, :location => @patient }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
      end
    end
    
	end
  
  def show
    @patient = Patient.find params[:id]
    
    respond_with @patient
  end
  
  def edit
    @patient = Patient.find params[:id]
    @states = State.order 'name ASC'
    @health_plans = HealthPlan.where(:enabled => 1).order('name ASC')
    @rooms = Room.order 'name ASC'
    
    respond_with @patient
  end

  def update
    @patient = Patient.find params[:id]

    respond_to do |format|
      if @patient.update_attributes params[:patient]
        format.html { redirect_to(admin_patients_url, :notice => 'Patient was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  def destroy
    Patient.find(params[:id]).destroy
		
    respond_to do |format|
      format.html { redirect_to(admin_patients_url) }
      format.xml  { head :ok }
    end
  end
  
  def enable
    @patient = Patient.find(params[:id])
    @patient.enabled = (@patient.enabled) ? false : true

    if @patient.save
      flash[:success] = (@patient.enabled) ? I18n.t(:patient_enabled) : I18n.t(:patient_disabled)
    else
      flash[:error] = I18n.t(:patient_enable_error)
    end
    
    redirect_to admin_patients_path
    
  end

end
