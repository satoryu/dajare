# encoding: utf-8
require "sinatra"
require "pebbles/dajare"

set :erb, :layout => true
set :views, settings.root + '/views'

enable :logging

helpers do
  def dajarize(original)
    Pebbles::Dajare.generate_dajare(original)
  end
end

get "/" do
  erb :index
end

post "/dajarize" do
  logger.info params[:text]
  @original = params[:text]
  @dajares = dajarize(@original)
  erb :dajarize
end
