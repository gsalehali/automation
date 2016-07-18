class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.string :genre
      t.text :description

      t.timestamps
    end
  end
end
