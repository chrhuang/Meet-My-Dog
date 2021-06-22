class CreateWalks < ActiveRecord::Migration[6.1]
  def change
    create_table :walks do |t|
      t.string :name
      t.text :description
      t.float :length
      t.integer :duration
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
