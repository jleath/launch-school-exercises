def any?(collection)
  collection.each do |value|
    return true if yield(value)
  end
  false
end

# def none?(container, &block)
#   !any?(container) { |value| block.call(value) }
# end

# def none?(container)
#   !any?(container) { |value| yield(value) }
# end

def none?(container, &block)
  !any?(container, &block)
end

puts none?([1, 3, 5, 6]) { |value| value.even? } == false
puts none?([1, 3, 5, 7]) { |value| value.even? } == true
puts none?([2, 4, 6, 8]) { |value| value.odd? } == true
puts none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts none?([1, 3, 5, 7]) { |value| true } == false
puts none?([1, 3, 5, 7]) { |value| false } == true
puts none?([]) { |value| true } == true