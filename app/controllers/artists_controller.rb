class ArtistsController < ApplicationController
  #1
  get '/artists' do
    @all_artists = Artist.all
  erb :'artists/index'
  end
  #3
  get '/artists/:slug' do
    @single_artist = Artist.find_by_slug(params[:slug])
    # binding.pry
    erb :'artists/show'
  end

end
