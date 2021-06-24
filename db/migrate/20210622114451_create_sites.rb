class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.decimal :longitude, precision: 10, scale: 6
      t.decimal :latitude , precision: 10, scale: 6
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
