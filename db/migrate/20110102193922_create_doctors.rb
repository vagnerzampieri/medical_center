class CreateDoctors < ActiveRecord::Migration
  def self.up
    add_column :servants, :crm, :string
    
    add_index :servants, :crm
  end

  def self.down
    remove_index :servants, :crm
    remove_column :servants, :crm
  end
end
