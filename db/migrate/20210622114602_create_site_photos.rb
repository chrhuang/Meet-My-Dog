class CreateSitePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :site_photos do |t|
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
