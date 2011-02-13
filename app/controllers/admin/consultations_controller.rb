class Admin::ConsultationsController < ApplicationController
  layout 'admin/application'
	respond_to :html, :xml
	
  def index
    @consultations = Consultation.order('consultation_date DESC')
    
    respond_with @consultations
  end
  
  def new
    @consultation = Consultation.new
    @specialties = Specialty.order('name ASC')
    @doctors = Doctor.order('name ASC')
    #@patients = select_patient
    #@health_plans = @patient.health_plan.name
  end
  
  def select_patient
    patients = Patient.all
    patients.each do |p|
      if patients.user_ids[0] == current_user.id
        @patients = Patient.where("id = #{patients.id}")
      else
        @patients = Patient.where('name ASC')
      end
    end
    @patients
  end
end
