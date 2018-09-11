require 'dotenv'
Dotenv.load

require './app'
require 'sidekiq/web'
require './config/initializers/sidekiq.rb'
require './app/workers/hard_worker.rb'
require './app/parsers/text_parser.rb'
require './app/parsers/string_parser.rb'
require './app/models/word.rb'

$Redis = Redis.new(
    host: ENV["REDIS_PORT_6379_TCP_ADDR"],
    port: ENV["REDIS_PORT_6379_TCP_PORT"]
  )
