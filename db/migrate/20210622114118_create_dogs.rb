class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :size
      t.string :gender
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
