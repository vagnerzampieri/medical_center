class CreateConsultations < ActiveRecord::Migration
  def self.up
    create_table :consultations do |t|
      t.references :specialty
      t.references :servant
      t.datetime :consultation_date
      t.references :patient
      t.timestamps
    end
  end

  def self.down
    drop_table :consultations
  end
end
