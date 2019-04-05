require './config/environment'

require_relative "./app/controllers/artists_controller"
# require_relative "./app/controllers/GenresController"
# require_relative "./app/controllers/SongsController"
begin
  fi_check_migration

  use Rack::MethodOverride
  run ApplicationController
  use ArtistsController
  # use SongsController
  # use GenresController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
