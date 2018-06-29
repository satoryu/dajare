$LOAD_PATH.unshift(File.expand_path('./src', __dir__))

require 'dajare'

map '/' do
  run Dajare::App
end

map '/api' do
  run Dajare::Api
end
