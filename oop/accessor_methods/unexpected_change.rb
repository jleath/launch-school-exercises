class Person
  def name=(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.last
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name

# We want to be able to pass a full name into the name setter method of this class
# Since we want the full name to be split into first_name and last_name instance
# variables, we have to do some extra work in the setter method.

# We need to do something similar in the getter method, in that we want to join
# the first_name and last_name variables back together.

# To achieve this, our call to attr_accessor is not enough. We'll have to replace that
# with both a custom getter and setter method.

# Within our setter method, we'll invoke the `split` method on the input string
# then save the first item in the resulting array to first_name, and save the
# second item in the resulting array to last_name.

# Within our getter method, we will simply use string interpolation to put the strings
# back together, we'll also invoke the strip method on the result of this interpolation.

# We do this because it is possible that a last name was not entered, in which case our
# string interpolation may result in a string with trailing whitespace.