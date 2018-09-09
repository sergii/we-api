require 'spec_helper'

RSpec.describe WordsAPI do

  before do
    DB[:words].delete
  end

  describe 'when hit the /word_counter endpoint' do
    it 'returns the 200 OK' do
      post '/word_counter'
      expect(last_response).to be_ok
    end
  end

  describe 'when hit the /word_statistics endpoint' do
    it 'returns the 200 OK' do
      get '/word_statistics'
      expect(last_response).to be_ok
    end
  end
end
