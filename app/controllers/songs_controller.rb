class SongsController < ApplicationController

  get '/songs' do
    @all_songs = Song.all
  erb :'songs/index'
  end
  #3
  get '/songs/:slug' do
    @single_song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'songs/show'
  end
end
