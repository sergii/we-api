class StringParser

  WORD_REGEXP = /\W+/

  def initialize(string)
    raise ArgumentError unless string

    @string = string
  end

  def parse
    words = @string.split(WORD_REGEXP)

    words.each do |word|
      Word.new(word).process
    end
  end
end
