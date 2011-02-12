class HealthPlan < ActiveRecord::Base
  has_many :doctor_health_plans
  has_many :servants, :through => :doctor_health_plans
  has_many :patients
  has_many :consultations
end
