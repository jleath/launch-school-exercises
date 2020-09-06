def repeater(str)
  str.split('').map { |c| c * 2 }.join('')
end

puts repeater('Hello') == 'HHeelllloo'
puts repeater('Good job!') == 'GGoooodd  jjoobb!!'
puts repeater('') == ''