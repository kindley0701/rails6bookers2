class AddAddressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :address, :string
    add_column :users, :postal_code, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end