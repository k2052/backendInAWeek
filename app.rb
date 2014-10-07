require 'scorched'
require 'rest-client'
require 'redcarpet'
require 'slim'

class App < Scorched::Controller
  render_defaults[:engine] = :slim
  render_defaults[:layout] = :layout
  config[:static_dir] = 'public'
  
  get '/' do
  	render :main
  end
end
