class AddCoordsToWalks < ActiveRecord::Migration[6.1]
  def change
    add_column :walks, :coords, :text
  end
end
