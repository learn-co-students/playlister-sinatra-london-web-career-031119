require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  #Index
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  #New
  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  #Create
  post '/songs' do
    @artist = Artist.find_or_create_by(name: params[:song][:artist])
    params[:song][:artist] = @artist
    @song = Song.create(params[:song])

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  #Show
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genre = @song.genres
    erb :'songs/show'
  end

  #Edit
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"songs/edit"
  end

  #Update
  patch '/songs/:slug' do
    @song = Song.find_by(name: params[:song][:name])
    @artist = Artist.find_or_create_by(name: params[:song][:artist])
    params[:song][:artist] = @artist
    @song.update(params[:song])

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

  #Destroy

end
