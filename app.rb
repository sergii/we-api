Bundler.require(:default)

require 'sinatra'
require 'json'
require 'sidekiq'
require 'pry-byebug'

class WordsAPI < Sinatra::Application

  before { logger.info "Incomming params: #{params}" }
  after { logger.info "Response: #{response.body}" }

  post '/word_counter' do

    allowed_types = %w(text/plain)

    if file_input
      halt(400, 'Please provide *.txt files only') unless allowed_types.include?(file_input[:type])

      puts "Uploading file, original name #{file_name.inspect}"
      TextParser.new(tempfile).parse
      puts "Upload #{file_name} file complete"
      status 200
    elsif string_input
      HardWorker.perform_async(string_input)
      status 200
    elsif url_input
      halt 404, 'Not implemented yet'
    else
      return 'Unprocessable case'
    end

    status 200
  end

  get '/word_statistics' do
    return 'To count appearance, please provide the word' unless params[:word]
    word_appearance = Word.new(params[:word]).appearance
    word_appearance.to_i.to_json
  end

  private

  def file_input
    params[:file]
  end

  def tempfile
    file_input[:tempfile]
  end

  def file_name
    file_input[:filename]
  end

  def string_input
    params[:string]
  end

  def url_input
    params[:url]
  end
end
