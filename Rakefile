require "rake/testtask"

task :default => :test

task :environment do
  require "#{File.dirname(__FILE__)}/lib/boot.rb"
end

Rake::TestTask.new do |t|
  t.pattern = "test/*test.rb" 
end

namespace :db do

  desc "Populate DB with initial values"
  task :seed => :environment do
  end

end