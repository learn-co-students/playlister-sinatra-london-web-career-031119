class ChangeSlugTypeArtists < ActiveRecord::Migration[5.2]
  def change
    change_column :artists, :slug, :string
  end
end
