class Phrase
  attr_reader :word_count

  def initialize(text)
    unless text.instance_of?(String)
      raise ArgumentError, 'String required for Phrase constructor'
    end
    @text = text
    @word_count = count_words
  end

  private

  def count_words
    counts = Hash.new(0)
    extract_words(@text).downcase.split.each { |word| counts[word] += 1 }
    counts
  end

  def extract_words(text)
    text = strip_quotes(text)
    strip_punctuation(text)
  end

  def strip_quotes(text)
    text.gsub(/(['"])(\w*?)\1/, '\2')
  end

  def strip_punctuation(text)
    text.gsub(/[^\w']/, ' ')
  end
end