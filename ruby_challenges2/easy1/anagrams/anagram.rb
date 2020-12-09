class Anagram
  def initialize(word)
    @word = word
  end

  def match(possible_anagrams)
    possible_anagrams.select { |string| anagram?(@word, string) }
  end

  private

  def anagram?(word1, word2)
    word1 = word1.downcase
    word2 = word2.downcase

    word1 != word2 && word1.chars.sort == word2.chars.sort
  end
end