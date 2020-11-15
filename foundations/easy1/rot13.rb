ALPHABET_SIZE = 26

def lowercase?(char)
  char.downcase == char
end

def alphabetic?(char)
  char.downcase.between?('a', 'z')
end

def rotate_char(c, n)
  return c unless alphabetic?(c)

  first_char = lowercase?(c) ? 'a' : 'A'
  difference_from_first = c.ord - first_char.ord
  unrotated_position = (difference_from_first + n) % ALPHABET_SIZE
  (first_char.ord + unrotated_position).chr
end

def unrotN(str, n)
  str.each_char.reduce('') { |result, char| result + rotate_char(char, -n) }
end

def unrot13(str)
  unrotN(str, 13)
end

names = File.open("names.txt", "r")
names.readlines.each { |line| puts unrot13(line) }