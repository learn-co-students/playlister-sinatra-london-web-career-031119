# Add seed data here. Seed your database with `rake db:seed`
require "faker"

Song.destroy_all
Artist.destroy_all
SongGenre.destroy_all
Genre.destroy_all

genres = ['pop', 'rnb', 'rock', 'rap', 'hiphop', 'indie']

10.times do 
  Artist.create(
    name: Faker::FunnyName.name,
  )
end

genres.each do |genre| 
    Genre.create(
      name: genre
    )
end

20.times do
    Song.create(
        name: Faker::Verb.base,
        artist_id: Artist.all.sample.id
        )
end

20.times do
    SongGenre.create(
        song_id: Song.all.sample.id,
        genre_id: Genre.all.sample.id
    )
end