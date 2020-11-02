class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty

# By default, all classes inherit a method called `to_s` from the `Object` class
# The default implementation of this method simply returns a string with the class
# name and an encoding of the object id of the object on which it is called.

# We can override methods inherited from other classes by simply defining them in
# the subclass. We do this in the example above by defining the to_s method. Our
# implementation will use string interpolation to print the @name instance variable.

# to_s is invoked by the puts method and when an object is used in string interpolation.
# It is very common to override the to_s method.

# When we pass our Cat object as an argument to `puts`, `puts` invokes the `to_s`
# method on the Cat object.