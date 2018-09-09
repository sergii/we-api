class Word < Sequel::Model
  # set_primary_key :word

  # Get all words records from the DB
  def words
    DB[:words]
  end

  # Find record by word
  def find(word)
    words.where(word: word)
  end

  # Find appearance by word. Return first record
  def word_appearance(word)
    record = words.where(word: word).first
    record ? record[:appearance] : 0
  end

  # Create new record
  def create(word)
    words.insert(word: word)
  end

  # Update existing record
  def update(word)
    record = find(word)
    record.update(appearance: Sequel[:appearance] + 1)
  end

  def process_string(string)
    words = string.split(/\W+/)

    # Iterate over all words
    words.each do |word|
      unless find(word).any?
        create(word)
      else
        update(word)
      end
    end
  end
end
