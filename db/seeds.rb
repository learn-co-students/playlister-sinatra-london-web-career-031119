# Add seed data here. Seed your database with `rake db:seed`


Artist.destroy_all
Genre.destroy_all
Song.destroy_all
LibraryParser.parse
# jt = Artist.create(name:'jt')
# Song.create(name:'Cry Me a River',artist: jt.id)
# Genre.create(name:'Pop')
