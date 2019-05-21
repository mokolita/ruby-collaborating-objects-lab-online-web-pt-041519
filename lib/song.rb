require 'pry'

class Song 
  
  attr_accessor :name
  attr_reader :artist  
  @@all = [] 
  
  def initialize(name)
    @name = name 
  end 
  
  def name=(name)
    @name = name 
  end 
  
  def artist=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
   
  end
  
  def artist
    @artist
  end 
  
  def self.new_by_filename(file)
    song_info = file.chomp(".mp3").split(" - ")
    song = Song.new(song_info[1])
    song.artist = (song_info[0])
    song
  end

  
   
end 