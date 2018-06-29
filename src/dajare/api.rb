require 'sinatra/base'
require 'sinatra/json'

module Dajare
  class Api < Sinatra::Base
    post '/' do
      json 'Success'
    end
  end
end