require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "mongoid_adjust"
    gem.summary = %Q{Add simple adjust! method to Mongoid}
    gem.description = %Q{Add simple adjust! method to Mongoid.}
    gem.email = "kmandrup@gmail.com"
    gem.homepage = "http://github.com/kristianmandrup/mongoid_adjust"
    gem.authors = ["Kristian Mandrup"]
    gem.add_dependency("mongoid", ">= 2.0.1")
    gem.add_dependency("bson", ">= 1.2")

    gem.add_development_dependency "rspec", ">= 2.0.1"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end


