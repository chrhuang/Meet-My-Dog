class CreateMesssages < ActiveRecord::Migration[6.1]
  def change
    create_table :messsages do |t|
      t.text :content
      t.time :date
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
