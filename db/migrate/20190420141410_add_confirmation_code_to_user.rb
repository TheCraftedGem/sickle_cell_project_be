class AddConfirmationCodeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :confirmation_code, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
  end
end
