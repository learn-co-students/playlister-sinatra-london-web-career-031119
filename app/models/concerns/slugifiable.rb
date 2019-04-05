module Slugify

  module InstanceMethods

    def slug
      slug = self.name.gsub(/[^0-9A-Za-z ]/, '')
      slug.gsub!(' ','-')
      slug.downcase
    end

    def deslug
      self.name.gsub('-',' ')
    end

  end


  module ClassMethods

    def find_by_slug(slug)
      deslug = slug.gsub!('-',' ')
      names = Artist.map(&:name)
      if names.include?(deslug)
        names.find{|name| name =~ deslug}
      elsif
        names = Song.map(&:name)
        if names.include?(deslug)
          names.find{|name| name =~ deslug}
        elsif
          names = Genre.map(&:name)
          if names.include?(deslug)
            names.find{|name| name =~ deslug}
          end
        end
      end
    end
  end
end
