require File.join(__dir__, 'app')
require File.join(__dir__, 'api')

map '/' do
  run Dajare::App
end
