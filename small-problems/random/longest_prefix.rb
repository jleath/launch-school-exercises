# Write a method to find the longest common prefix string amongst an array 
# of strings

# If there is no common prefix, return empty string
# All given inputs are in lowercase letters.
# if any strings in the input are empty, return empty string

# find the length of the shortest string
# starting from length 1, get the prefix of the strings in the array
# if all the prefixes match, store this prefix in a variable to be returned by the method
# repeat with increasing prefix lengths until the prefix is greater than the shortest string in the array


def common_prefix(strings)
  return "" if strings.empty?
  prefix_length = 1
  longest_prefix = ""

  max_prefix_length = strings.map { |string| string.size }.min
  
  loop do
    break if prefix_length > max_prefix_length

    prefixes = strings.map { |string| string.slice(0, prefix_length) }
    if prefixes.all? { |string| string == prefixes[0] }
      longest_prefix = prefixes[0]
    end
    prefix_length += 1
  end
  longest_prefix
end

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"

