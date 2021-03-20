require 'pry'
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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    #binding.pry
    new_song = Song.new
    new_song.name=(song_name)
    new_song
  end

  def self.create_by_name(song_name)
    #binding.pry
    new_song = new_by_name(song_name)
    new_song.save
    new_song

  end

  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end

  def self.alphabetical
    #binding.pry
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    split_filename = filename.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song

  end

  def self.create_from_filename(filename)
  create_file = new_from_filename(filename)
  create_file.save
  create_file
  end

def self.destroy_all
  self.all.clear
  
end



end
