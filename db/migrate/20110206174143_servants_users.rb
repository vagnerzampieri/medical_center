class ServantsUsers < ActiveRecord::Migration
  def self.up
    create_table :servants_users, :id => false do |t|
      t.references :servant
      t.references :user
    end
    add_index :servants_users, :servant_id
    add_index :servants_users, :user_id
  end

  def self.down
    remove_index :servants_users, :servant_id
    remove_index :servants_users, :user_id
    drop_table :servants_users
  end
end
