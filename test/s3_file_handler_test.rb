require 'test_helper'

class S3FileHandlerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::S3FileHandler::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
