class CreateAnimeGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :anime_genres do |t|
      t.references :anime, foreign_key: true, null: false
      t.references :genre, foreign_key: true, null: false

      t.timestamps
    end
  end
end
