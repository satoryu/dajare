require File.expand_path './test_helper', __dir__

class ApiTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Dajare::Api
  end

  def json_body
    JSON.parse(last_response.body)
  end

  def test_text_given
    post '/', JSON.generate(text: 'こんにちわ'), {'Content-Type': 'application/json'}

    assert last_response.ok?
    assert json_body.key?('puns')
  end
end
