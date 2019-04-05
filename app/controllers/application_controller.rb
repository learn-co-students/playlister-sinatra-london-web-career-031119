require 'rack-flash'

class ApplicationController < Sinatra::Base
  enable :sessions
  use Rack::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
  get '/artists' do
    @artists = Artist.all
        erb :"artists/index"
  end
  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end
  get '/genres' do
    @genres = Genre.all
    erb :"genres/index"
  end
  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :"artists/show"
  end

  get '/songs/new' do
    @genre = Genre.all
    erb :"songs/new"
  end

  post '/songs' do
  
  artist = Artist.find_or_create_by(name: params[:artist])
  song = Song.create(name: params[:name], artist: artist)
  params[:genres].each do |genre|
    SongGenre.create(genre_id: genre.to_i, song_id: song.id)
  end 
  
  flash[:message] = "Successfully created song."
  redirect to("/songs/#{song.slug}")
  end

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

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :"genres/show"
  end
end