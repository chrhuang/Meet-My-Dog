class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.time :date
      t.text :description
      t.integer :max_dog
      t.references :walk, null: false, foreign_key: true

      t.timestamps
    end
  end
end
