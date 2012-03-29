# encoding: utf-8
require "sinatra"
require "pebbles/dajare"
require "cgi"

set :erb, :layout => true
set :views, settings.root + '/views'

enable :logging

helpers do
  def dajarize(original)
    Pebbles::Dajare.generate_dajare(original)
  end
end

get "/" do
  if params[:text]
    logger.info params[:text]
    @original = params[:text]
    @dajare = dajarize(@original).sample
  end
  erb :index
end

