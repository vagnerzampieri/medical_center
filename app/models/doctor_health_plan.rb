class DoctorHealthPlan < ActiveRecord::Base
  belongs_to :servant
  belongs_to :health_plan
end
