require 'scorched'
require 'rest-client'
require 'redcarpet'
require 'slim'

class App < Scorched::Controller
  render_defaults[:engine] = :slim
  render_defaults[:layout] = :layout

  get '/' do
  	render :main
  end

  get '/quote' do
  	render :project_form
  end

  post '/quote' do
  	halt "Bad Bot!" unless params[:spam].blank?

    @project = params[:project]

		RestClient.post "https://api:key-#{ENV['MAILGUN_KEY']}@api.mailgun.net/v2/samples.mailgun.org/messages",
			  :from    => params[:project][:email],
			  :to      => ENV['EMAIL_TO'],
			  :subject => "I want a backend in a week!",
			  :text    => render(:project_email_template)

  	render :thanks
  end
end
