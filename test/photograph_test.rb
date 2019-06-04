require './lib/photograph'
require './lib/artist'
require 'minitest/autorun'
require 'minitest/pride'
class PhotographTest < Minitest::Test
  def setup
    attributes = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: 4,
      year: 1954
    }
    @photograph = Photograph.new(attributes)
  end

  def test_it_exists
    expected = Photograph
    actual = @photograph
    assert_instance_of expected, actual
  end

  def test_it_has_attributes
    expected = "1"
    actual = @photograph.id
    assert_equal expected, actual

    expected = "Rue Mouffetard, Paris (Boy with Bottles)"
    actual = @photograph.name
    assert_equal expected, actual

    expected = 4
    actual = @photograph.artist_id
    assert_equal expected, actual

      expected = 1954
      actual = @photograph.photograph.year
      assert_equal expected, actual
  end

  
  pry(main)> attributes = {
    id: "2",
    name: "Ansel Adams",
    born: "1902",
    died: "1984",
    country: "United States"
  }

  pry(main)> artist = Artist.new(attributes)
  #=> #<Artist:0x00007fc2d0a6c080...>

  pry(main)> artist.id
  #=> "2"

  pry(main)> artist.name
  #=> "Ansel Adams"

  pry(main)> artist.born
  #=> "1902"

  pry(main)> artist.died
  #=> "1984"

  pry(main)> artist.country
  #=> "United States"
  ```
