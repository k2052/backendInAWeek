Bundler.require ENV['RACK_ENV'] || :development

require './app'
require 'sprockets'
require "sprockets-sass"
require 'compass'

map '/assets' do
  env = Sprockets::Environment.new
  env.append_path './assets/css'
  env.append_path './assets/vendor/css'
  
  env.append_path 'assets/js'
  env.append_path 'assets/vendor/js'
  
  env.append_path 'bower_components'
  run env
end

map '/' do
	run App
end
