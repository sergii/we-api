require './config/environment.rb'

run Rack::URLMap.new('/' => WordsAPI, '/sidekiq' => Sidekiq::Web)
