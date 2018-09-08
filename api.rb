require 'sinatra'

class WebAPI < Sinatra::Application
  get '/' do
    'Hello world'
  end
end
