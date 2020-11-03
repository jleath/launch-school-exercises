class Person
  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
  end
end

person1 = Person.new(1234567899)
puts person1.phone_number

person1.phone_number = 9987654321
puts person1.phone_number

# In this example, we don't want the `phone_number` instance variable
# to be modified from outside of the class.

# Our Person class currently contains a call to the `attr_accessor` method.
# This method provides us with both a getter and a setter for the `phone_number`
# instance variable.

# We can change this to `attr_reader` and we will only have a getter method.