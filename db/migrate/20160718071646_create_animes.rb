class CreateAnimes < ActiveRecord::Migration[5.0]
  def change
    create_table :animes do |t|
      t.string :en_name, null: false
      t.string :jap_name
      t.string :ara_name
      t.date :started, null: false
      t.date :finished
      t.integer :seasons
      t.integer :episodes
      t.decimal :rating

      t.timestamps
    end
  end
end
