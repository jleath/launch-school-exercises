def greetings(arr, hsh)
  "Hello, #{arr.join(' ')}! Nice to have a \
  #{hsh[:title]} #{hsh[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })