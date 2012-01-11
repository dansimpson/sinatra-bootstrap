$: << File.dirname(__FILE__)

require "bundler"
require "sinatra/base"
require "sinatra/reloader"
    
Bundler.require

require "application"

run Bootstrap::Application