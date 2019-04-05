class SongController < Sinatra::Base

  set :views, "app/views"

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genres = @song.genres
    erb :'/songs/show'
  end

end
