# The input is a string str of digits. Cut the string into chunks (a chunk here
# is a substring of the initial string) of size sz (ignore the last chunk if its 
# size is less than sz).

# If a chunk represents an integer such as the sum of the cubes of its digits is 
# divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. 
# Put together these modified chunks and return the result as a string.

# empty string should result in an empty string
# a chunk size of 0, should also result in an empty string

# first, split the string into chunks and store them in an array
# starting from index 0,
#   slice a substring starting from index of size sz
#   if the substring is less than size sz, discard it
#   otherwise add it to the chunk array

# then, for each chunk, decide whether it needs to be reversed or rotated
# if the sum of the cubes of each digit are divisible by 2,
#   reverse the chunk
# otherwise,
#   rotate the chunk left by one position

# put the chunks together and return as a string
#   join the chunks together into one string, with the empty string as the separator.

def get_chunks(str, sz)
  return [] if sz == 0
  start_index = 0
  chunks = []
  while start_index < str.size
    chunk = str.slice(start_index, sz)
    if chunk.size == sz
      chunks << chunk
    end
    start_index += sz
  end
  chunks
end


p get_chunks("123456987654", 6) == ["123456", "987654"]
p get_chunks("664438769", 8) == ["66443876"]
p get_chunks("", 8) == []
p get_chunks("123456779", 0) == []


# sum of cubes of digits is divisible by two
def meets_condition(str)
  return false if str.empty?
  numbers = str.chars.map { |char| char.to_i }
  numbers.map! { |num| num ** 3 }
  numbers.reduce(:+) % 2 == 0
end

 p meets_condition("987653") == true
 p meets_condition("123456") == false
 p meets_condition("") == false

def rotate(chunk)
  first_digit = chunk.slice!(0, 1)
  chunk + first_digit
end

p rotate("123456") == "234561"
p rotate("987654") == "876549"
p rotate("") == ""
p rotate("1") == "1"

def revrot(str, sz)
  chunks = get_chunks(str, sz)
  chunks.map! { |chunk| meets_condition(chunk) ? chunk.reverse : rotate(chunk) }
  chunks.join('') 
end

p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == "" 
p revrot("563000655734469485", 4) == "0365065073456944"