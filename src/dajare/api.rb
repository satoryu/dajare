require 'sinatra/base'
require 'sinatra/json'
require 'dajare/helpers'

module Dajare
  class Api < Sinatra::Base
    enable :logging

    helpers Dajare::Helpers

    post '/' do
      begin
        body = JSON.parse(request.body.read)
      rescue JSON::ParserError
        return 400
      end

      text = body['text']
      return 400 if text.nil?

      res = { puns: dajarize(text) }

      json res
    end
  end
end
