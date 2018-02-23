class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :timesadded
      t.references :users, index: true, foreign_key: true
      t.references :songs, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
