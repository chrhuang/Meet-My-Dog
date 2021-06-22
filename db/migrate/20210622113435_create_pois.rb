class CreatePois < ActiveRecord::Migration[6.1]
  def change
    create_table :pois do |t|
      t.string :name

      t.timestamps
    end
  end
end
