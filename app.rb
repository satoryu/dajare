require "cgi"
require 'sinatra/base'
require 'pebbles/dajare'
require 'json'

class Dajare < Sinatra::Base
  set :erb, layout: true
  set :views, settings.root + '/views'

  enable :logging

  helpers do
    def dajarize(original)
      Pebbles::Dajare.generate_dajare(original)
    end

    def h(str)
      CGI.escape_html(str.to_s)
    end
  end

  get "/" do
    if params[:text]
      logger.info params[:text]
      @original = params[:text]
      @original.chomp! if @original
      @dajare = dajarize(@original.chomp).sample
    end

    erb :index
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

  run! if app_file == $0
end
