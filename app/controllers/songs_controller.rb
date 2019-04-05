class SongController < Sinatra::Base

  get '/songs' do
    erb :index
  end

end
