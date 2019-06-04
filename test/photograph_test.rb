require './lib/photograph'
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
    actual = @photograph.year
    assert_equal expected, actual
  end
end
