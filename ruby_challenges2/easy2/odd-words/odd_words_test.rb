require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'odd_words'

Minitest::Reporters.use!

class OddWordsTest < Minitest::Test
  def test_single_word
    assert_equal('word.', odd_word_reversed('word.'))
  end

  def test_single_word_space_point
    assert_equal('word.', odd_word_reversed('word    .'))
  end

  def test_several_words
    assert_equal('these era some sdrow.', 
                 odd_word_reversed('these are some words.'))
  end

  def test_several_words_space_point
    assert_equal('these era some sdrow.', 
                 odd_word_reversed('these are some words  .'))
  end

  def test_capitals
    assert_equal('These erA Some sdroW.', 
                 odd_word_reversed('These Are Some Words.'))
  end

  def test_punctuation_and_numbers
    assert_equal('These ereh are emos punctuation skram ?!? !#?# Welp!.',
                 odd_word_reversed('These here are some punctuation marks ?!? #?#! Welp!.'))
  end
end