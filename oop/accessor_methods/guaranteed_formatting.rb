class Person
  attr_reader :name

  def name=(new_name)
    @name = new_name.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name

# On line 10, we call the name= method on person1. We need to define this
# method within the Person class. We can't just use attr_writer to generate
# a setter method, because we would like to do some extra processing
# on the value before assigning it to @name.

# We manually define a name= method on lines 4-6, where we assign the result
# of calling capitalize on the argument to @name.

# We then attempt to print the value of person1.name on line 11. We need
# a getter method for this to work. We don't need to do anything special with
# this method so we can just use the attr_reader method to create this getter method.