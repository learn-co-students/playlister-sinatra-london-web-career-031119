require "rack-flash"

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash
  get "/songs" do
    @songs = Song.all
    erb :'songs/index'
  end

  get "/songs/new" do
    @genres = Genre.all
    erb :'songs/new'
  end

  get "/songs/:name" do
    @song = Song.find_by_slug(params[:name])

    erb :'songs/show'
  end

  post "/songs" do
    @song = Song.create({name: params[:song_name]})
    @song.artist = Artist.find_or_create_by({name: params[:artist_name]})
    @song.genre_ids = params[:genres]
    if @song.save
      flash[:message] = "Successfully created song."
    end
    redirect "/songs/#{@song.slug}"
  end

  #changing a song's artist
  #  updates the song's artist (FAILED - 1)
  #  renders to the song show page (FAILED - 2)
  get "/songs/:name/edit" do
    @song = Song.find_by_slug(params[:name])
    erb :'songs/edit'
  end

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    if !params[:artist_name].empty?
        @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    end
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
end
