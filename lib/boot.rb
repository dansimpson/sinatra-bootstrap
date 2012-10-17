$: << File.dirname(__FILE__)

require "logger"
require "bundler/setup"
require "sinatra/base"
require "sinatra/reloader"

Bundler.require

module Bootstrap
  
  def env
    ENV["RACK_ENV"] || "development"
  end

  def log
    @logger || Logger.new(STDOUT)
  end

  def root
    File.dirname(__FILE__) + "/.."
  end

end

Dir["#{$:.last}/**/*.rb"].each do |file|
  require file
end    
