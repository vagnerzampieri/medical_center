class AddFieldToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :health_plan_id, :integer
    add_index :patients, :health_plan_id
  end

  def self.down
    remove_index :patients, :health_plan_id
    remove_column :patients, :health_plan
  end
end
