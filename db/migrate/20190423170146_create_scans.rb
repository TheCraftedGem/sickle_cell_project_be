class CreateScans < ActiveRecord::Migration[5.2]
  def change
    create_table :scans do |t|
      t.string :result
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
