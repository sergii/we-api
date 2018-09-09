require 'sequel'
require './app'

default_connection_string = 'postgres://user:password@localhost/web_api_development'
DB = Sequel.connect(ENV.fetch('DATABASE_URL') || default_connection_string)

require './app/models/word'

run WordsAPI
