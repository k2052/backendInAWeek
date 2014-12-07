$:.unshift File.join "#{root}", "lib"

require "kramdown"
require "slim"
require "sprockets-sass"
set :slim, :pretty => true

# Enable pretty URLS
activate :directory_indexes

# Bust caches
activate :cache_buster

# Set Build Dir
set :build_dir, "build"

# Set Asset paths
set :images_dir, 'images'

# Set the Markdown engine
set :markdown_engine, :kramdown

# Append sprockets paths
sprockets.append_path File.join "#{root}", "source/stylesheets"
sprockets.append_path File.join "#{root}", "source/javascripts"
sprockets.append_path File.join "#{root}", "source/assets/js"
sprockets.append_path File.join "#{root}", "source/assets/css"
sprockets.append_path File.join "#{root}", "bower_components"
sprockets.append_path File.join "#{root}", "vendor/assets"

# Views direcgtores
set :layout_dir, "layouts"

if ENV['RACK_ENV'] == 'production'
  compass_config do |config|
    config.output_style = :compressed
    config.sass_options = { :line_comments => false }
  end
end

activate :deploy do |deploy|
  deploy.method = :git
end
