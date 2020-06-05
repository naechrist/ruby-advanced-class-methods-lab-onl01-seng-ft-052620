class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new 
    song.save 
    song 
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song 
  end
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
     song
    else 
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort {|a, b| a.name <=> b.name }
  end
  
  def self.new_from_filename(file_name)
    artist_name, song_name = file_name.split(" - ")
    song = self.new_by_name(song_name.gsub(".mp3", ""))
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
end



