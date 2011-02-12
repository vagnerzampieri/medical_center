class AddFieldHealthPlanToConsultation < ActiveRecord::Migration
  def self.up
    add_column :consultations, :health_plan_id, :integer
    add_index :consultations, :health_plan_id
  end

  def self.down
    remove_index :consultations, :health_plan_id
    remove_column :consultations, :health_plan_id
  end
end
