class AddIndexesToPatientsTable < ActiveRecord::Migration[5.2]
  def change
    add_index :patients, :first_name
    add_index :patients, :last_name
    add_index :patients, :zip_code
  end
end
