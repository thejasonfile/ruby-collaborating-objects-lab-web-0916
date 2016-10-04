require "pry"
class Song

  @@all = []
  attr_accessor :name, :artist, :all

  def initialize(name)
    @name = name
    @@all << self
  end

  def all
    @@all
  end

  def self.new_by_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    song = Song.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    if song.artist.class == Array
      song.artist.each do |artist| artist.add_song(song) end
      else
      song.artist.add_song(song)
    end
    song
  end

end
