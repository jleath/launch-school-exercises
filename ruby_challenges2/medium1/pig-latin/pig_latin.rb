class PigLatin
  def self.translate(phrase)
    phrase.split.map { |word| translate_word(word) }.join(' ')
  end

  def self.translate_word(word)
    consonant = consonant_sound(word)
    remainder = word.slice(consonant.size, word.size - consonant.size)
    "#{remainder}#{consonant}ay"
  end

  def self.consonant_sound(word)
    consonant = word.match(/^(qu|squ|[^aeiou]+)/i).to_s
    return '' if consonant[0, 2] == 'yt' || consonant[0, 2] == 'xr'
    consonant
  end
end
