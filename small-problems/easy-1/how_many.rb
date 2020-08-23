# How Many? 
#
# input: an array (arr)
#
# output: a hash in which the keys are the elements of arr and
#         the values are the number of times that element is found in
#         arr, the method will also print the contents of the hash
#
# rules: an empty array will result in an empty hash.
#        since we are using a hash to count occurences, two elements will
#        be "equal" when their hash value is identical and el1.eql?(el2)
#        returns true.
#
# mental model: initialize an empty hash
#               for each element in the given array, update the hash
#               using that element as the key.
#               if the element is not already a key in the hash, default
#               the value to 1.
#               Otherwise, increment the value for that key.
#

def count_occurrences(arr)
  counts = Hash.new(0)
  arr.each { |item| counts[item] += 1 }
  print_hash(counts)
  return counts
end

def print_hash(h)
  h.each { |key, value| puts "#{key} => #{value}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# The Further Exploration section states "Try to solve the problem when
# words are case insensitive, e.g. "suv" == "SUV".
#
# This changes the problem quite a bit because we are now assuming we 
# are only working with strings. The count_occurrences method above
# will work for any item with an eql? and a hash method. Here is a method 
# called count_strings.

def count_strings(arr)
  counts = Hash.new(0)
  arr.each { |item| counts[item.downcase] += 1 }
  print_hash(counts)
  return counts
end

vehicles.push('suv')
string_test = count_strings(vehicles)
if string_test['suv'] == 2
  puts "count_strings works"
else
  puts "count_strings does not work"
end
