class RenameSongidColumnArtistsTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :artists, :song_id, :slug
  end
end
