# Given a hash of ranks and honor values, return the rank of the pair
# which has the closest rank and honor.

# If there are several users who come closest, return the one with the lowest rank

# if hash is empty, return nil
# we're going to assume that all key and values are valid integers

# the rank of the closest match we've found will be current_nexus
# the difference between honor and rank of the closest will be current_nexus_delta
# iterate through each key/value pair in the input hash
#   if the absolute value of the honor and rank of the current pair is < the delta
#     current_nexus will be the current rank
#     delta will be the difference between the current honor and rank
#   if the absolute value of the honor and rank of the current pair is == to the delta
#     replace current_nexus with the current rank if it is lower than the rank of the existing nexus
#   otherwise, we'll move on to the next key/value pair
# return current_nexus

def nexus(users)
  current_nexus = nil
  current_nexus_delta = nil
  users.each do |rank, honor|
    delta = (rank-honor).abs
    if current_nexus.nil?
      current_nexus = rank
      current_nexus_delta = delta
    elsif delta < current_nexus_delta
      current_nexus = rank
      current_nexus_delta = honor
    elsif delta == current_nexus_delta
      current_nexus = (current_nexus < rank) ? current_nexus : rank
    end
  end
  current_nexus
end

p nexus({1 => 3, 3 => 3, 5 => 1}) == 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3