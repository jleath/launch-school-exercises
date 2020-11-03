class Person
  attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name

# On line 5, we instantiate an object of type Person.
# Then, on line 6, we attempt to set the value of an instance variable
# named name to the string 'Jessica'. This will fail because the Person
# class does not have a setter method called `name`

# We can address this by adding a call to the `attr_writer` method in the Person
# class, passing in the symbol :name as an argument.

# Next, we attempt to access the instance variable `name` and print it on line 7.
# Again, this will fail because the Person class has no getter methods for `name`.
# We can address this by adding a call to the `attr_reader` method, passing in the
# symbol :name as an argument.

# Now we have separate calls to the attr_writer and attr_reader methods for the
# same instance variable. We can combine these into one single `attr_accessor` call.