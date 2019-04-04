require 'pry'
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    Slugifiable.call(self.name)
  end

  def self.find_by_slug(slug)
    self.all.find{|a| a.slug == slug}
  end

end
