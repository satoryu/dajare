require File.expand_path '../test_helper', __FILE__

class AppTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Dajare::App
  end

  def test_index
    get '/'

    assert last_response.ok?
  end
end
