class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :otp_secret_key
      t.integer :office_id

      t.timestamps
    end
  end
end
