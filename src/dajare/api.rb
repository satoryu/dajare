require 'sinatra/base'
require 'sinatra/json'

module Dajare
  class Api < Sinatra::Base
    get '/' do
      json 'Success'
    end
  end
end