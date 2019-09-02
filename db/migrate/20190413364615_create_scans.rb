class CreateScans < ActiveRecord::Migration[5.2]
  def change
    create_table :scans do |t|
      t.integer :result, default: 0
      t.text :note
      t.integer :patient_id
      t.datetime :created_at
      t.datetime :updated_at
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
