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
  end

  def test_resonse_json
    expected_puns = %w[こんにチワワ こんにチワトラ]

    Pebbles::Dajare.stub :generate_dajare, -> (_) { expected_puns } do
      post '/', JSON.generate(text: 'こんにちわ'), { 'Content-Type': 'application/json' }

      puns = json_body['puns']
      refute_nil puns
      assert_equal expected_puns, puns
    end
  end
end
