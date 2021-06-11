# frozen_string_literal: true

require 'cgi'
require 'sinatra/base'
require 'sinatra/json'
require 'pebbles/dajare'
require 'json'
require 'dajare/helpers'

module Dajare
  class App < Sinatra::Base
    set :erb, layout: true
    set :views, File.expand_path('./views', __dir__)
    set :public_folder, File.expand_path('../../public', __dir__)

    enable :logging

    helpers Dajare::Helpers

    get '/' do
      if params[:text]
        logger.info params[:text]
        @original = params[:text]
        @original&.chomp!
        @dajare = dajarize(@original.chomp).sample
      end

      erb :index
    end
  end
end
