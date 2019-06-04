require './lib/artist'
require './lib/photograph'
require './lib/curator'
require 'minitest/autorun'
require 'minitest/pride'
class CuratorTest < Minitest::Test
  def setup
    @photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }

    @photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

    @photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }

    @photo_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }

    @artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }

    @artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    @artist_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }
    @curator = Curator.new
  end

  def test_curator_exists
    expected = Curator
    actual = @curator
    assert_instance_of expected, actual
  end

  def test_it_has_attributes

    expected = []
    actual =  @curator.artists
    assert_equal expected, actual

    expected = []
    actual =  @curator.photographs
    assert_equal expected, actual
  end


  def test_class_can_add_artist
    expected = []
    actual = @curator.artists
    assert_equal expected, actual

    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    @curator.add_artist(@artist_3)

    expected = Artist
    actual = @curator.artists.first
    assert_instance_of expected, actual

    expected = Artist
    actual = @curator.artists.last
    assert_instance_of expected, actual
  end

  def test_class_can_add_photograph

    expected = []
    actual = @curator.photographs
    assert_equal expected, actual

    @curator.add_photograph(@photo_1).first
    @curator.add_photograph(@photo_2).last
    @curator.add_photograph(@photo_3)
    expected = Photograph
    actual = @curator.photographs.first
    assert_instance_of expected, actual

    expected = Photograph
    actual = @curator.photographs.last
    assert_instance_of expected, actual

    expected = "Rue Mouffetard, Paris (Boy with Bottles)"
    actual = @curator.photographs.first.name
    assert_equal expected, actual

  end

  def test_it_can_find_artist_by_id
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    @curator.add_artist(@artist_3)
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    @curator.add_photograph(@photo_3)

    diane_arbus = @curator.find_artist_by_id("3")
    expected = diane_arbus
    actual = @curator.find_artist_by_id("3")
    assert_equal expected, actual
  end

  def test_it_can_find_photos_by_artsit
    skip
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    @curator.add_artist(@artist_3)
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    @curator.add_photograph(@photo_3)
    diane_arbus = @curator.find_artist_by_id("3")
   @curator.find_photographs_by_artist(diane_arbus)
    expected = @photo_3[:name]
    actual = @curator.find_photographs_by_artist(diane_arbus)
    assert_equal expected, actual

    expected = 1
    actual = @curator.find_photographs_by_artist(diane_arbus).count
    assert_instance_of expected, actual


  end

  def test_it_can_find_artists_with_multiple_photographs
skip
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    @curator.add_artist(@artist_3)
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    @curator.add_photograph(@photo_3)
    @curator.add_photograph(@photo_4)

    expected  = []
    actual = @curator.artists_with_multiple_photographs
    assert_equal expected, actual

    expected = 1
    actual = @curator.artists_with_multiple_photographs
    assert_equal expected, actual

    # expected =
    # actual = @curator.artists_with_multiple_photographs
    # assert_equal expected, actual
  end

  def test_it_can_find_photographs_by_artist_from_country
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    @curator.add_artist(@artist_3)
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    @curator.add_photograph(@photo_3)
    @curator.add_photograph(@photo_4)
    expected = @photo_1[:name]
    actual = @curator.photographs_taken_by_artist_from("United States").first
    assert_equal expected, actual

    expected = []
    actual = @curator.photographs_taken_by_artist_from("Argentina")
    assert_equal expected, actual
  end
end
