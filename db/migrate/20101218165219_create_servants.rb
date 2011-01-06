class CreateServants < ActiveRecord::Migration
  def self.up
    create_table :servants do |t|
      t.string :type
      t.string :name
      t.date :birth
      t.string :sex
      t.string :cpf
      t.references :state
      t.string :email
      t.string :address
      t.string :number 
      t.string :complement 
      t.string :zip_code
      t.string :district
      t.string :city
      t.string :area_code
      t.string :telephone
      t.string :mobile
      t.boolean :enabled, :default => true      

      t.timestamps
    end
    add_index :servants, :type
    add_index :servants, :state_id
    add_index :servants, :enabled
  end

  def self.down
    drop_table :servants
  end
end
