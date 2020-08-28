def palindrome?(text)
  text.reverse == text
end

def real_palindrome?(text)
  palindrome?(text.downcase.delete('^a-z0-9'))
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true
p real_palindrome?("madam i'm adam") == true
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
