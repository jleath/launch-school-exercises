def palindrome?(text)
  text.reverse == text
end

p palindrome?('madam') == true
p palindrome?('Madam') == false
p palindrome?("madam i'm adam") == false
p palindrome?('356653') == true

p palindrome?([1, 2, 3, 2, 1]) == true
p palindrome?([]) == true
p palindrome?([1]) == true
