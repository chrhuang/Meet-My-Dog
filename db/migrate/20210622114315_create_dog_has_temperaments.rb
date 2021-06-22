class CreateDogHasTemperaments < ActiveRecord::Migration[6.1]
  def change
    create_table :dog_has_temperaments do |t|
      t.references :temperament, null: false, foreign_key: true
      t.references :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
