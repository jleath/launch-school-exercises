# Read a text file and print the longest sentence in the file based on number
# of words and the number of words in that sentence.

# Sentences may end with periods, exclamation points, or question marks.

# Any sequence of characters that are not whitespace or sentence-ending
# characters should be treated as a word.

# the program should ask the user for a path to a file
# the program will assume that the user provides a path to a file
#  that contains plain text.

# prompt the user for a path to a text file
# read in the contents of that text file and store it in a string
# split the string into an array based on the sentence-ending chars (.?!)
# for each sentence in the array, split the sentence into words
#   if this is the longest sentence we've seen, save the sentence and
#   the number of words in the sentence.
# Once we've processed all of the sentences, print out the longest
#   sentence and the number of words in the sentence.
# if there is more than one sentence with the same maximum word count,
#  we will return the first one that occurs in the file.

PUNCTUATION = /(?<=[?!.])/
LINEBREAK = /\R/

def get_sentences(filename, delimiter_pattern)
  path = File.absolute_path(filename)
  unless File.readable?(path)
    puts "Invalid file name: #{filename}"
    return nil
  end
  text = File.read(path)
  # got this regular expression from an old post on stack overflow
  # https://stackoverflow.com/a/18089658
  sentences = text.split(delimiter_pattern)
  # the lookbehind regular expression also keeps newlines characters,
  # which we don't want.
  sentences.delete("\n")
  sentences
end

puts 'Enter the path to a plain-text file: '
filename = gets.chomp
sentences = get_sentences(filename, PUNCTUATION) 
if sentences
  longest = sentences.max_by { |sentence| sentence.split.size }
  puts longest
  puts "Word Count: #{longest.split.size}"
end
