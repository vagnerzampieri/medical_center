class CreateDoctorHealthPlans < ActiveRecord::Migration
  def self.up
    create_table :doctor_health_plans, :id => false do |t|
      t.references :servant
      t.references :health_plan

      t.timestamps
    end
    add_index :doctor_health_plans, :servant_id
    add_index :doctor_health_plans, :health_plan_id
  end

  def self.down
    drop_table :doctor_health_plans
  end
end
