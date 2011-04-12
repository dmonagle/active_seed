require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "active_seed"
  gem.homepage = "http://github.com/intrica/active_seed"
  gem.license = "MIT"
  gem.summary = "Seeds data using activerecord."
  gem.description = "ActiveSeed Gives the ability to seed data by inserting it via activerecord. Also allows you to manage sets of data and seed based on the current environment."
  gem.email = "david.monagle@intrica.com.au"
  gem.authors = ["David Monagle"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end

Jeweler::RubygemsDotOrgTasks.new

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "active_seed #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
