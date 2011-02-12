class Room < ActiveRecord::Base
  has_many :patients
end
