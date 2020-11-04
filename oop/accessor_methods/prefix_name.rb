class Person
  PREFIX = 'Mr.'
  attr_writer :name

  def name
    PREFIX + ' ' + @name
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name

# On line 10, we instantiate a Person object and assign it to a local variable
# named person1.

# On line 11, we call the `name` setter method, passing in the string 'James' as
# an argument. This method was defined using `attr_writer` in the `Person` class,
# so the instance variable `@name` is simply assigned to this string.

# On line 12, we print the return value of the `name` getter method invoked on
# person1. We need to define this method in order for this code to work. We can't
# just use the `attr_reader` method to define this getter method, because we want
# to add a prefix to the `@name` instance variable.

# So within Person, we define a method called `name`. We add the prefix (which we've
# saved as a class constant), and return the resulting string.