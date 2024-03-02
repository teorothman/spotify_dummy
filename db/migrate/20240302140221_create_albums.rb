class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :description
      t.references :creator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
