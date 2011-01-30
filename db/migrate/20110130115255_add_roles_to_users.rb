class AddRolesToUsers < ActiveRecord::Migration
  def self.up
    guest = User.find 0
    role = Role.find 1
    guest.roles << role
    guest.save
    
    devel = User.find 1
    role = Role.find 2
    devel.roles << role
    devel.save
    
    administrative = User.find 2
    role = Role.find 3
    administrative.roles << role
    administrative.save
    
    doctor = User.find 3
    role = Role.find 4
    doctor.roles << role
    doctor.save
    
    nurse = User.find 4
    role = Role.find 5
    nurse.roles << role
    nurse.save
    
    patient = User.find 5
    role = Role.find 6
    patient.roles << role
    patient.save
  end

  def self.down
  end
end
