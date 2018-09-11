class HardWorker
  include Sidekiq::Worker

  def perform(string)
    StringParser.new(string).parse
  end
end
