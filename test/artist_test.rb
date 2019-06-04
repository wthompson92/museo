require './lib/artist'
require 'minitest/autorun'
require 'minitest/pride'
class ArtistTest < Minitest::Test
  def setup
    attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"  }

    @artist = Artist.new(attributes)
  end

  def test_it_exists
    expected = Artist
    actual = @artist
    assert_instance_of expected, actual
  end

  def test_it_has_attributes
    expected = "2"
    actual = @artist.id
    assert_equal expected, actual

    expected = "Ansel Adams"
    actual = @artist.name
    assert_equal expected, actual

    expected = "1902"
    actual = @artist.born
    assert_equal expected, actual

    expected = "1984"
    actual = @artist.died
    assert_equal expected, actual

    expected = "United States"
    actual = @artist.country
    assert_equal expected, actual
  end
end
