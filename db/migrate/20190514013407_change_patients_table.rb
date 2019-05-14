class ChangePatientsTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :patients, :address, :street_address
    rename_column :offices, :address, :street_address
    rename_column :users, :address, :street_address
    rename_column :scans, :patient_id, :office_id
  end
end
