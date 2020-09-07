# input: an integer, the number of lights and the number of repetitions
# output: an integer array, representing the numbers of the lights that
#         are left on after the repetitions

# switches are numbered from 1 to n, inclusive
# all lights are turned on during the first round
# during the second round, toggle all switches that are multiples of two
# during the third round, toggle all switches that are multiples of three
# continue, toggling multiples of the current round number, until you have 
#   completed n rounds.

# will assume n is positive
# if n == 1, will return [1]. if n == 0, will return an empty array (or possibly nil)

# initialize a boolean array, switches, with n+1 values, all set to true
#   we will be ignoring the 0th index
# use a counter variable, curr_round, that will go from 2 to n and iterate
#   on each iteration, toggle the values in switches for all indices that are
#   multiples of curr_round
# use the boolean values array to build a new array that has the indices for all
# values that were at true at the end of the repetitions

def toggle(bool)
  bool ? false : true
end

def toggle_multiples(lights, i)
  curr_multiple = i
  while curr_multiple < lights.size
    lights[curr_multiple] = toggle(lights[curr_multiple])
    curr_multiple += i
  end
end

def initialize_lights(n)
  lights = 0.upto(n).map { true }
  lights[0] = false
  lights
end

def perform_repetitions(n)
  lights = initialize_lights(n)
  2.upto(n).each { |curr_round| toggle_multiples(lights, curr_round) }
  result = []
  lights.each_with_index { |state, index| result << index if state }
  result
end

puts perform_repetitions(5)  == [1, 4]
puts perform_repetitions(10)  == [1, 4, 9]
puts perform_repetitions(1)  == [1]
puts perform_repetitions(0) == []
puts perform_repetitions(1000) == [
   1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 
   324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961
 ]