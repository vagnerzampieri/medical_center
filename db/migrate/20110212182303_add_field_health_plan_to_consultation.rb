class AddFieldHealthPlanToConsultation < ActiveRecord::Migration
  def self.up
    add_column :consultations, :health_plan_id, :integer
    add_column :consultations, :enabled, :boolean, :default => true
    add_index :consultations, :health_plan_id
    add_index :consultations, :enabled
  end

  def self.down
    remove_index :consultations, :enabled
    remove_column :consultations, :enabled
    remove_index :consultations, :health_plan_id
    remove_column :consultations, :health_plan_id
  end
end
