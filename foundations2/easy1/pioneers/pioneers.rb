ALPHABET_SIZE = 26

def alphabetical?(char)
  !!char.match(/[a-z]/i)
end

def unrot13(text)
  text.chars.map { |char| alphabetical?(char) ? rotate(char, -13) : char }.join('')
end

def rotate(char, n)
  alphabet_start = (char.match(/[a-z]/)) ? 'a'.ord : 'A'.ord
  char_position = char.ord - alphabet_start.ord
  new_char_position = (char_position + n) % ALPHABET_SIZE
  (alphabet_start + new_char_position).chr
end

encrypted_names = File.open("pioneers.txt", "r").readlines.map(&:strip)
encrypted_names.each { |name| puts unrot13(name) }
