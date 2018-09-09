require 'sinatra'
require 'sequel'
require 'json'

class WordsAPI < Sinatra::Application
  before { logger.info "Incomming params: #{params}" }
  after { logger.info "Response: #{response.body}" }

  post '/word_counter' do
    Word.new.process_string(params[:string])
    status 200
  end

  get '/word_statistics' do
    word_appearance = Word.new.word_appearance(params[:word])
    word_appearance.to_json
  end
end
