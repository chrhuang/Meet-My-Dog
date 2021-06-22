class CreateWalkHasPois < ActiveRecord::Migration[6.1]
  def change
    create_table :walk_has_pois do |t|
      t.float :long
      t.float :lat
      t.references :poi, null: false, foreign_key: true
      t.references :walk, null: false, foreign_key: true

      t.timestamps
    end
  end
end
