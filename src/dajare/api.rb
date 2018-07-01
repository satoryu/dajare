require 'sinatra/base'
require 'sinatra/json'
require 'dajare/helpers'

module Dajare
  class Api < Sinatra::Base
    enable :logging

    helpers Dajare::Helpers

    post '/' do
      body = JSON.parse(request.body.read)
      text = body['text']
      res = { puns: dajarize(text) }

      json res
    end
  end
end