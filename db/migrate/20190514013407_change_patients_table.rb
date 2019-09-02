class ChangePatientsTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :patients, :address, :street_address
    rename_column :offices, :address, :street_address
    add_column :scans, :office_id, :integer
  end
end
