class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
    	t.string :name
      t.date :birth
      t.string :sex
      t.string :cpf
      t.string :address
      t.string :number
      t.string :complement
      t.string :zip_code
      t.string :district
      t.string :city
      t.references :state
      t.string :ddd
      t.string :telephone
      t.string :mobile
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
