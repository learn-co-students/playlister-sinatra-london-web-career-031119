require_relative './concerns/slugifiable.rb'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  include Slugify::InstanceMethods
  # extend Slugify::ClassMethods

  def self.find_by_slug(slug)
    Artist.find_by('lower(name) = ?', slug.gsub('-',' '))
  end

end
