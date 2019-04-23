class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :phone_number
      t.string :hours
      t.integer :provider_id
      t.integer :patient_id
      t.integer :appointment_id

      t.timestamps
    end
  end
end
