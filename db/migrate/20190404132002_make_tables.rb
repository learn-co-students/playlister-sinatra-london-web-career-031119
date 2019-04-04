class MakeTables < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
    end

    create_table :artists do |t|
      t.string :name
      t.integer :song_id
    end

    create_table :genre do |t|
      t.string :name
    end

    create_table :songs_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
