class RemoveAddressFromPatientsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :patients, :street_address
    remove_column :patients, :city
    remove_column :patients, :state
  end
end
