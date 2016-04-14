require "cgi"
require 'sinatra/base'
require 'pebbles/dajare'
require 'json'
require 'net/http'
require 'uri'

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

  get '/fb/messages' do
    if params['hub.verify_token'] == ENV['FB_MESSENGER_VERIFY_TOKEN']
      params['hub.challenge']
    else
      "Failed"
    end
  end

  post '/fb/messages' do
    json = JSON.parse(request.body.read)
    message = json['entry']['messaging']['message']['text']
    sender = json['entry']['messaging']['sender']['id']

    data = {
      recipient: {
        id: sender
      },
      message: {
        text: dajarize(message).sample
      }
    }

    res = Net::HTTP.post_form(
      URI.parse("https://https://graph.facebook.com/v2.6/me/messages?access_token=#{ENV['FB_PAGE_ACCESS_TOKEN']}"),
      data)

  end

  run! if app_file == $0
end
