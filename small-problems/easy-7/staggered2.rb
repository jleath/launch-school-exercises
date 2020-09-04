def staggered_case(str, start_upcase=true, ignore_nonalpha=true)
  counter = 0
  valid_chars = 0
  result = ''
  loop do
    break if counter == str.size

    if valid_chars.even?
      result << (start_upcase ? str[counter].upcase : str[counter].downcase)
    else
      result << (start_upcase ? str[counter].downcase : str[counter].upcase)
    end
    valid_chars += 1 if (!ignore_nonalpha || str[counter].count('a-zA-z') > 0)
    counter += 1
  end
  result
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
puts staggered_case('ignore 77 the 444 numbers', false) == 'iGnOrE 77 tHe 444 NuMbErS'
puts staggered_case('ignore 77 the 444 numbers', false, false) == 'iGnOrE 77 tHe 444 nUmBeRs'
puts staggered_case('ignore 77 the 444 numbers', true, false) == 'IgNoRe 77 ThE 444 NuMbErS'
