# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

def repeat(text, count)
  return if count <= 0
  count.times { puts text }
end

repeat("negative input", -3)
repeat("zero", 0)
repeat("one time", 1)
repeat("three times", 3)
