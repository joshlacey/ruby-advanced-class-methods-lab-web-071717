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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(*name)
    #binding.pry
    if self.find_by_name(*name) != nil
        self.find_by_name(*name)
    else
      self.create_by_name(*name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|item| item.name}
  end

  def self.new_from_filename(file)
    #binding.pry
    song = Song.new
    #binding.pry
    splitted = file.split(" - ")
    song.artist_name = splitted[0]
    song.name = splitted[1].split(".")[0]
    song
  end

  def self.create_from_filename(file)
    @@all << self.new_from_filename(file)
  end

  def self.destroy_all
    @@all.clear
  end
end
