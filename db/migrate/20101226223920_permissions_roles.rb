class PermissionsRoles < ActiveRecord::Migration
  def self.up
    create_table :permissions_roles, :id => false do |t|
      t.references :role
      t.references :permission
    end
    add_index :permissions_roles, :role_id
    add_index :permissions_roles, :permission_id
  end

  def self.down
    drop_table :permissions_roles
  end
end
