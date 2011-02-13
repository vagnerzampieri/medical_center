class Consultation < ActiveRecord::Base
  belongs_to :specialty
  belongs_to :servant
  belongs_to :patient
  belongs_to :health_plan
end
