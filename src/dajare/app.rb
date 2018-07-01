require "cgi"
require 'sinatra/base'
require 'sinatra/json'
require 'pebbles/dajare'
require 'json'
require 'dajare/helpers'

module Dajare
  class App < Sinatra::Base
    set :erb, layout: true
    set :views,  File.expand_path('./views', __dir__)
    set :public_folder, File.expand_path('../../public', __dir__)

    enable :logging

    helpers Dajare::Helpers

    get "/" do
      if params[:text]
        logger.info params[:text]
        @original = params[:text]
        @original.chomp! if @original
        @dajare = dajarize(@original.chomp).sample
      end

      erb :index
    end

    get '/descriptor' do
      json descriptor
    end

    post '/webhook' do
      req = JSON.parse(request.body.read)
      logger.debug "Request: #{req.to_json}"

      if req['event'] == 'room_message'
        message = req['item']['message']['message']
        message.gsub!(/\A\/d.*\s+/, '')
        { color: 'purple', message: dajarize(message).sample, message_format: :text }.to_json
      else
        logger.info "'#{req['event']}' is called"
        { color: 'red', message: "Unexpected event: #{req['event']}" }.to_json
      end
    end
  end
end
