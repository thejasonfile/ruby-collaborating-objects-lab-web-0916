class Artist

  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    songs << song
    song.artist = self
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(artist_name)
    artist_names = @@all.map do |artist|
      artist.name
    end

    if artist_names.include?(artist_name)
      self.all.each do |artist| artist.name = artist_name end
    else
      self.new(artist_name)
    end
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end
end