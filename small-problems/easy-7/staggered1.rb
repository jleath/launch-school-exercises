def staggered_case(str, start_upcase=true)
  counter = 0
  result = ''
  loop do
    break if counter == str.size

    if counter.even?
      result << (start_upcase ? str[counter].upcase : str[counter].downcase)
    else
      result << (start_upcase ? str[counter].downcase : str[counter].upcase)
    end
    counter += 1
  end
  result
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
puts staggered_case('ignore 77 the 444 numbers', false) == 'iGnOrE 77 tHe 444 nUmBeRs'
