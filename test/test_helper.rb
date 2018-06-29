ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'

$LOAD_PATH.unshift(File.expand_path('../src', __dir__))

require 'dajare'
