class AddCityToSites < ActiveRecord::Migration[6.1]
  def change
        add_column :sites, :city, :string
  end
end
