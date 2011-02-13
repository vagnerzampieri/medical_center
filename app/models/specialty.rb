class Specialty < ActiveRecord::Base
  has_many :doctor_specialties
  has_many :servants, :through => :doctor_specialties
  has_many :consultations
end
