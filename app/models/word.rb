class Word
  def initialize(word)
    @word = word
  end
  attr_reader :word

  def process
    cache.watch(word) do
      if cache.exists(word)
        update
      else
        create
      end
    end
  end

  # Create a new record
  def create
    cache.set(word, 1)
  end

  # Update existing record
  def update
    cache.incr(word)
  end

  def appearance
    cache.get(word)
  end

  private

  # I know, it's ugly, just for the sake of simplicity
  def cache
    $Redis
  end
end
