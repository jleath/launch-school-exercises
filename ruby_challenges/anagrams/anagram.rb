class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    sorted_word = @word.downcase.chars.sort

    candidates.select do |candidate|
      if candidate.downcase == @word.downcase
        false
      elsif candidate.downcase.chars.sort == sorted_word
        true
      else
        false
      end
    end
  end
end