# Write a method that takes two Array arguments in which each array
# contains a list of numbers, and returns a new Array that contains
# the product of every pair of numbers that can be formed between 
# the elements of the two Arrays. The results should be sorted by
# increasing value.
#
# Assume that neither argument is empty

def multiply_all_pairs(arr1, arr2)
  products = []
  arr1.each do |n1|
    arr2.each { |n2| products.append(n1 * n2) }
  end
  products.sort
end

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |pair| pair.reduce(:*) }.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

