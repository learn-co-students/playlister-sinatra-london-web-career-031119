class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do


"Wilkommen"

  end

  get "/songs" do

    @songs = Song.all

    erb :"songs/index"
  end

  get "/songs/:slug" do


    erb :"songs/show"
  end

  get "/song/new" do

    erb :"songs/new"
  end

  get "/artists" do

    @artists = Artist.all

    erb:"artists/index"
  end

  get "/artists/:slug" do

    slug_me = Slugifiable.new
    @artist = slug_me.find_by_slug(params[:slug])
binding.pry
0
  erb :"artists/show"
  end


    get "/genres" do

      @genres = Genre.all

      erb:"genres/index"
    end



end
