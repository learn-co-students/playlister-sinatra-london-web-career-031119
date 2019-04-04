class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    Slugifiable.call(self.name)
  end

  def self.find_by_slug(slug)
    self.all.find{|s| s.slug == slug} #clean code it. or not.
  end

end
