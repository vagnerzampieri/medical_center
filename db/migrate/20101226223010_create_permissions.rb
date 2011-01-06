class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.string :name
      t.string :description
      t.string :controller
      t.string :action
      t.boolean :enabled, :default => true

      t.timestamps
    end
    add_index :permissions, :name
    add_index :permissions, :controller
    add_index :permissions, :action
    add_index :permissions, :enabled
  end

  def self.down
    drop_table :permissions
  end
end
