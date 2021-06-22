class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.float :long
      t.float :lat
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
