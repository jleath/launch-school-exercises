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
  !!(/%\{\w+\}/.match(word))
end

def get_madlib_input(word)
  word_type = word.delete('%{}')
  print("Enter one #{word_type}: ")
  gets.chomp
end

def prompt_for_words(text)
  output = []
  text.split.each do |word|
    if madlib_pattern?(word)
      word_type = /%\{\w+\}/.match(word).to_s.delete('^a-zA-Z')
      print("Enter one #{word_type}: ")
      output << word.sub(/%\{\w+\}/, gets.chomp)
    else
      output << word
    end
  end
  output.join(' ')
end

madlib_text = read_file('madlib1.txt')
puts prompt_for_words(madlib_text)