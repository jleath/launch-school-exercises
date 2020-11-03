class Person
  attr_accessor :name
  attr_writer :phone_number
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name

# On line 7, we attempt to set the value of a Person object's 
# instance variable called name.

# On line 8, we attempt to set the value of a Person object's
# instance variable called phone_number.

# Then, on line 9 we attempt to retrieve the value of a Person
# object's instance variable called name and print it.

# Based on this information, we need a setter method for phone_number,
# as well as a getter and a setter method for name.

# We can get these methods with two method calls, one to the
# attr_writer method, passing in :phone_number, and one to the
# attr_accessor method, passing in :name.