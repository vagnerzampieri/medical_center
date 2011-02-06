class PatientsUsers < ActiveRecord::Migration
  def self.up
    create_table :patients_users, :id => false do |t|
      t.references :patient
      t.references :user
    end
    add_index :patients_users, :patient_id
    add_index :patients_users, :user_id
  end

  def self.down
    remove_index :patients_users, :patient_id
    remove_index :patients_users, :user_id
    drop_table :patients_users
  end
end
