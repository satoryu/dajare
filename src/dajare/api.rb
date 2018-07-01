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
      return 400 if text.nil?

      res = { puns: dajarize(text) }

      json res
    end
  end
end