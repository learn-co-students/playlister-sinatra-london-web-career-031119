class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs



    def slug
     self.name.downcase.gsub(' ','-')

    end


    def self.find_by_slug(sample) #sample.gsub(/\s+/,'-')
      Artist.all.find {|artist| artist.slug == sample}
    end

end
