NOUN_PATTERN = '#{noun}'
VERB_PATTERN = '#{verb}'
ADJECTIVE_PATTERN = '#{adjective}'
ADVERB_PATTERN = '#{adverb}'

def read_file(filename)
  path = File.absolute_path(filename)
  unless File.readable?(path)
    puts "Invalid file name: #{filename}"
    return nil
  end
  File.read(path)
end

def madlib_pattern?(word)
  !!(/^#\{\w+\}$/.match(word))
end

def get_madlib_input(word)
  word_type = word.delete('#{}')
  print("Enter one #{word_type}: ")
  gets.chomp
end

def prompt_for_words(text)
  text.split.each do |word|
    if madlib_pattern?(word)
      word_type = word.delete('#{}')
      print("Enter one #{word_type}: ")
      madlib_words[word_type] << gets.chomp
    end
  end
end

puts /^#\{\w+\}$/.match('#noun}')