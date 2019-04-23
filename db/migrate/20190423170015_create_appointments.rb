class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.datetime :last_visit
      t.integer :office_id
      t.integer :patient_id
      t.integer :appointment_result

      t.timestamps
    end
  end
end
