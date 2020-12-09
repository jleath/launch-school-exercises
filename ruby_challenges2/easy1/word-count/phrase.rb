# Count the occurrences of each word in a given "phrase"

# Words are separated by whitespace
# Should be able to call `word_count` multiple times and get a consistent result
# Should ignore punctuation, except for apostrophes ex. "don't"
# Need to handle special case of single quoted strings ex. 'large'
# Numerical digits count as characters in a word
# case insensitive
class Phrase
  ALLOWED_IN_WORD = "'\""
  attr_reader :word_count

  def initialize(text)
    @text = text
    @word_count = count_words(text)
  end

  private

  def count_words(text)
    remove_punctuation(text)
      .downcase
      .split
      .reduce(Hash.new(0)) do |counts, word|
        counts[word] += 1
        counts
      end
  end

  def remove_punctuation(string)
    string.gsub(/[^a-zA-Z0-9#{ALLOWED_IN_WORD} ]/, ' ')
          .gsub(/\s[#{ALLOWED_IN_WORD}]+(\S)/, ' \1')
          .gsub(/(\S)[#{ALLOWED_IN_WORD}]+\s/, '\1 ')
  end
end