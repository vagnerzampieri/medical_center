class DoctorSpecialty < ActiveRecord::Base
  belongs_to :servant
  belongs_to :specialty
end

