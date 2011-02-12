class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.string :name

      t.timestamps
    end
    add_column :patients, :room_id, :integer
    add_index :patients, :room_id
    
    Room.create(:id => 1, :name => 'Particular')
    Room.create(:id => 2, :name => 'Coletivo')
  end

  def self.down
    remove_index :rooms, :room_id
    drop_table :rooms
  end
end
