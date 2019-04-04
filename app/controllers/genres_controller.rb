require 'pry'
class GenresController < ApplicationController

  #Index
  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  #New

  #Create

  #Show
  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @artists = @genre.artists
    @songs = @genre.songs
    erb :'genres/show'
  end

  #Edit

  #Update

  #Destroy

end
