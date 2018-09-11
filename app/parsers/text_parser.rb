require 'sidekiq'
require './app/workers/hard_worker.rb'

class TextParser

  EMPTY_LINE_SYMBOL = "\n"

  def initialize(path)
    raise ArgumentError unless File.exists?(path)

    @file = File.open(path)
  end

  def parse
    @file.each_line do |line|
      next if line == EMPTY_LINE_SYMBOL

      HardWorker.perform_async(line)
    end
  end
end
