class ChangeGenreInGenre < ActiveRecord::Migration[5.0]
  def up
    change_column :genres, :genre, :string, null: false
  end

  def down
    change_column :genres, :genre, :string
  end
end
