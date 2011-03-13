class CreateDoctorSpecialties < ActiveRecord::Migration
  def self.up
    create_table :doctor_specialties, :id => false do |t|
      t.references :servant
      t.references :specialty
    end
    add_index :doctor_specialties, :servant_id
    add_index :doctor_specialties, :specialty_id
  end

  def self.down
    drop_table :doctor_specialties
  end
end
