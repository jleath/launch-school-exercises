# Pig latin rules:
# 1. If a word begins with a vowel sound, add an "ay" sound to the end of
#    the word
# 2. If a word begins with a consonant sound, move it to the end of the word
#    then add an "ay" sound to the end of the word.

# Other edge cases:

# chair, queen -> consonant "sound" rather than a consonant letter
# input may contain multiple words, each word should be translated
#  words will be separated by whitespace
# y is sometimes treated as a vowel and sometimes not (yellow vs yttria)
# x is sometimes treated as a vowel and sometimes not (xenon vs xray)

# Need to be able to determine between a consonant "sound" and a vowel
# "sound".

# From the test cases, it appears that a consonant "sound" includes all
#  letters at the beginning of a word until we reach the first vowel
#  (y and x) are edge cases.

# u does not count as a vowel when it follows a q
# y followed by a consonant counts as a vowel
# x followed by a consonant counts as a vowel

class PigLatin
  def self.translate(phrase)
    phrase.split.map { |word| PigLatin.translate_word(word) }.join(' ')
  end

  # begin by checking the first letter of the word. If it is a, e, i, o, or u
  # just return word + "ay"
  # edge case sounds to pass tests:
  #  ch - simple consonant chunk
  #  qu - vowel following q
  #  squ - vowel following q
  #  th - simple consonant chunk
  #  sch - simple consonant chunk
  #  yt - y followed by consonant is vowel
  #  xr - x followed by consonant is vowel
  # will use regex to extract two separate parts of the word
  # the result of the word will be a combination of groups we can capture
  # the word will be split into consonant_sound and remainder
  # either of these may be empty strings
  # the result of the method will be "#{remainder}#{consonant_sound}ay"
  # the tricky part is extracting the consonant_sound part. There are a lot of
  # edge cases so we need to be very careful about how we extract the consonant
  # sound out.
  def self.translate_word(word)
    consonant = PigLatin.consonant_sound(word)
    remainder = word.slice(consonant.size, word.size - consonant.size)
    "#{remainder}#{consonant}ay"
  end

  # We will use regex to get the consonant sound. Using the match method on the
  # string we can get a MatchData object. Once we have this, we will return
  # the result of calling to_s on that object.
  # For now we will hardcode the edge cases from the test suite and include
  # an option for just a simple consonant chunk
  def self.consonant_sound(word)
    consonant = word.match(/^(qu|squ|[^aeiou]+)/i).to_s
    return '' if consonant[0, 2] == 'yt' || consonant[0, 2] == 'xr'
    consonant
  end
end