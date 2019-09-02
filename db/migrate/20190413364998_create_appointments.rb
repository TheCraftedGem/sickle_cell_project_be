class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.integer :office_id
      t.integer :patient_id
      t.integer :user_id
      t.integer :appointment_result, default: 0

      t.references :user, foreign_key: true
      t.references :patient, foreign_key: true
      t.references :office, foreign_key: true

      t.timestamps
    end
  end
end
