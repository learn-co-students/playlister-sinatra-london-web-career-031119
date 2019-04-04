class Slugifiable

  def self.call(string)
    string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

end
