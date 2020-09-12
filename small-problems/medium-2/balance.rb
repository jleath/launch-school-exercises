def balanced?(string)
  paren_count = 0
  string.chars.each do |c|
    if c == '('
      paren_count += 1
    elsif c == ')'
      return false if paren_count == 0
      paren_count -= 1
    end
  end
  paren_count.zero?
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false