require 'sinatra/base'
require 'sinatra/json'
require 'dajare/helpers'

module Dajare
  class Api < Sinatra::Base
    enable :logging

    helpers Dajare::Helpers

    post '/' do
      json 'Success'
    end
  end
end