class AddAddressToSites < ActiveRecord::Migration[6.1]
  def change
    add_column :sites, :address, :string
  end
end
