class Person
  def initialize(name)
    @name = name
  end

  def name
    @name[0..-1]
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name

# On line 12, we use the `name` getter method on an object of type Person.
# We then call the destructive `reverse!` method on the result of this getter method.

# We don't want our instance variables to by mutated like this so we need to modify the
# name getter method. Currently, our name method is created by a call to attr_reader.
# We will replace this method call with a custom name method in which we create a copy
# of @name via slicing.