class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :phone_number
      t.datetime :last_visit
      t.integer :office_id
      t.integer :appointment_id
      t.integer :scan_id
      t.datetime :last_visit
      t.date :date_of_birth

      t.timestamps
    end
  end
end
