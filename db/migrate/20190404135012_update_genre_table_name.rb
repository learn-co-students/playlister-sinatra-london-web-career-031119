class UpdateGenreTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :genre, :genres
  end
end
