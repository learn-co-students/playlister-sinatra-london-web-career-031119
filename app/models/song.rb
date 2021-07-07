class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres


  def slug(sample_name)
      find_by_slug(sample_name.gsub(/\s+/,'-'))
  end

  def self.find_by_slug()

  end


end
