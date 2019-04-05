class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  include Slugify::InstanceMethods
  # extend Slugify::ClassMethods

  def self.find_by_slug(slug)
    Genre.find_by('lower(name) = ?', slug.gsub('-',' '))
  end

end
