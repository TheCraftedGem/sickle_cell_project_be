class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.bigint :phone_number
      t.string :hours

      t.references :user, foreign_key: true
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
