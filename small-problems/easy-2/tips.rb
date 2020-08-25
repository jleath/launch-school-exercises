# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display both the
# tip and the total amount of the bill.

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

print 'What is the bill? '
bill = gets.chomp.to_f

print 'What is the tip percentage? '
tip_percent = gets.chomp.to_f / 100.0
tip = tip_percent * bill
total = bill + tip
puts format("The tip is $%.2f", tip)
puts format("The total is $%.2f", total)