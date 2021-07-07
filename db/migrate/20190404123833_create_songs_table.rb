class CreateSongsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |i|
      i.string :name
      i.integer :artist_id
    end
  end
end
