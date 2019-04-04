Models
- Artist
- Song
- Genre
- SongGenre

An artist have many songs.
An artist have many genres, through SongGenre.

Song
ID    Name    Artist_ID
1     Song1   1          
2     Song2   2         
song1.artist = TaylorS
song1.genre_ids = pop.id #??won't it return [1, 2]? Assume it's AR.

Artist
ID    Name      slug  
1     TaylorS   taylor-s
2     FuckedUp  fucked-up
artist1.songs = [1,2]
artists.genres = [TerriblePop, CooliosRock] #not sure how this works? Assume it's AR.
artists1.songs.each do |song|
  song1.genre #=> TerriblePop
end

Genre
ID    Name
1     TerriblePop
2     CooliosRock
Genre.all
genre.songs = [song1, song2] #not sure how this works? Assume it's AR.
genre.artists = [TaylorS, FuckedUp] #not sure how this works? Assume it's AR.
TerriblePop.songs = []
TerriblePop.songs.each do |song|
  song.artist
end

SongGenre
ID    Song_ID   Genre_ID
1     1         1
2     1         2
3     2         1

/songs/slug
/songs/1
/songs/song-1
/artists/1
/artists/taylor-s


LibraryParser
"db/data".call #=> ??
