class NursesSpecifications < ActiveRecord::Migration
  def self.up
    create_table :nurses_specifications, :id => false do |t|
      t.references :nurse
      t.references :specification
    end
    add_index :nurses_specifications, :nurse_id
    add_index :nurses_specifications, :specification_id
  end

  def self.down
    remove_index :nurses_specifications, :nurse_id
    remove_index :nurses_specifications, :specification_id
    drop_table :nurses_specifications
  end
end
