$: << File.dirname(__FILE__) + "/../"

ENV["RACK_ENV"] = "test"

require "lib/boot"
require "application"

require "minitest/pride"
require "minitest/autorun"
require "minitest/spec"
require "rack/test"
require "capybara"
require "capybara/dsl"
require "capybara_minitest_spec"

class MiniTest::Spec
  include Rack::Test::Methods
end

Capybara.app = Bootstrap::Application

class MiniTest::Spec
  include Capybara::DSL
end

class Capybara::Session
  def params
    Hash[*URI.parse(current_url).query.split(/\?|=|&/)]
  end
end