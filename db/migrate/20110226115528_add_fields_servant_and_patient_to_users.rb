class AddFieldsServantAndPatientToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :servant_id, :integer
    add_column :users, :patient_id, :integer
    add_index :users, :servant_id
    add_index :users, :patient_id
  end

  def self.down
    remove_index :users, :servant_id
    remove_index :users, :patient_id
    remove_column :users, :servant_id
    remove_column :users, :patient_id
  end
end
