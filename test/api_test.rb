require File.expand_path './test_helper', __dir__

class ApiTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Dajare::Api
  end

  def test_index
    get '/'

    assert last_response.ok?
  end
end