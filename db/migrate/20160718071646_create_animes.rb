class CreateAnimes < ActiveRecord::Migration[5.0]
  def change
    create_table :animes do |t|
      t.string :en_name, null: false
      t.string :jap_name
      t.string :ara_name
      t.references :genre, foreign_key: true, null: false
      t.date :started, null: false
      t.date :finished
      t.integer :sesones
      t.integer :episods
      t.references :rating, oreign_key: true, null: false

      t.timestamps
    end
  end
end
