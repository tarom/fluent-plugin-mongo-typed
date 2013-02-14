# encoding: utf-8

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
  gem.name = "fluent-plugin-mongo-typed"
  gem.homepage = "http://github.com/tarom/fluent-plugin-mongo-typed"
  gem.license = "MIT"
  gem.summary = %Q{Typed mongo output plugin}
  gem.description = %Q{Typed mongo output plugin}
  gem.email = "taro.toys@gmail.com"
  gem.authors = ["MORIYA Taro"]
  # dependencies defined in Gemfile
  gem.add_dependency "fluent-plugin-mongo", "~> 0.6.13"
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end
task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "fluent-plugin-mongo-typed #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
