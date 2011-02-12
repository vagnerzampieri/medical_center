#encoding: UTF-8
class CreateHealthPlans < ActiveRecord::Migration
  def self.up
    create_table :health_plans do |t|
      t.string :name
      t.boolean :enabled

      t.timestamps
    end
    HealthPlan.create(:id => 1, :name => 'Particular', :enabled => 1)
    HealthPlan.create(:id => 2, :name => 'Dix Classic Essencial', :enabled => 1)
    HealthPlan.create(:id => 3, :name => 'Dix 10', :enabled => 1)
    HealthPlan.create(:id => 4, :name => 'Dix 20', :enabled => 1)
  end

  def self.down
    drop_table :health_plans
  end
end
