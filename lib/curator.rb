require './lib/artist'
require './lib/photograph'
require 'pry'
class Curator
  attr_reader :artists, :photographs
  def initialize
    @photographs = []
    @artists = []
  end

  def add_artist(attributes)
    artist = Artist.new(attributes)
    @artists << artist
  end

  def add_photograph(attributes)
    photo = Photograph.new(attributes)
    @photographs << photo
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      photo.artist_id  == artist.id
    end
  end

  def artists_with_multiple_photographs
    multiple = Hash.new
    @photographs.map do |photo|
      @artists.map do |artist|
        photo.artist_id == artist.id
        multiple[artist.name] = photo.id
      end
    end
    multiple
    array = []
    multiple.each do |key, value|
      if  multiple[key].count >= 2
        then array << key
      else
        array
      end
    end
    array
  end

  def photographs_taken_by_artist_from(country)
    by_country = []
    @artists.find_all do |artist|
        artist.country == country
         id = artist.id
  
     @photographs.find_all do |photo|
        photo.artist_id == id
        by_country << photo.name
      end
    end
    by_country
  end
end
