class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.datetime :last_visit
      t.integer :office_id
      t.integer :appointment_id
      t.integer :scan_id
      
      t.references :scan, foreign_key: true
      t.references :appointment, foreign_key: true
      t.references :office, foreign_key: true
      
      t.timestamps
    end
  end
end
