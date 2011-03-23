class Admin::ConsultationsController < ApplicationController
  layout 'admin/application'
	respond_to :html, :xml, :js, :json
	before_filter :admin?
	
  def index
    @consultations = Consultation.order 'consultation_date DESC'
    
    respond_with @consultations
  end
  
  def new
    @consultation = Consultation.new
    @specialties = Specialty.order 'name ASC'
    
    if params[:specialty_id].present?
      specialty = Specialty.find params[:specialty_id]
      @doctors = []
      specialty.doctor_specialties.each do |doctor|
        @doctors << doctor
      end    
    end
    #@doctors = Doctor.order 'name ASC'
    @patients = select_patient
    #@health_plans = @patients.health_plan.name
  end
  
  private
  
    def select_patient
      patients = Patient.all
      patients.each do |patient|
        if patient.user.id == current_user.id
          @patients = Patient.where "id = #{patient.id}"
        else
          @patients = Patient.order 'name ASC'
        end
      end
      @patients
    end
end
