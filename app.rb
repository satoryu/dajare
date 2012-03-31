#!/usr/bin/env ruby
# encoding: utf-8

require "sinatra"
require "cgi"

require "bundler"
Bundler.require

set :erb, :layout => true
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

