require 'spec_helper'

RSpec.describe WebAPI do
  describe 'when hit the root page' do
    it 'returns greetings' do
      get '/'

      expect(last_response).to be_ok
      expect(last_response.body).to eq('Hello world')
    end
  end
end
