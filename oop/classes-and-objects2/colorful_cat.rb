class Cat
  attr_reader :name

  COLOR = "purple"

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{COLOR} cat."
  end
end

kitty = Cat.new('Sophie')
kitty.greet

# This example demonstrates the usage of constants within classes.
# In the body of the class definition, we define a variable named
# COLOR. Ruby considers variables that start with a capital letter
# as constants, which means that the Ruby interpreter will issue a
# warning if you attempt to reassign this value.

# In our example, we assign the string "purple" to this new constant.
# The greet method uses string interpolation to print out a greeting
# that includes the `name` instance variable and this constant.

# Class constants differ from other variables in that they have lexical scope.
# This means that where we attempt to use the value is important. This example
# works because we are using the constant within the class in which it is defined.

# Subclasses will inherit constants from their superclass, so we could
# use the COLOR constant in any subclass of Cat. Outside of that context, we would
# need to use the scope resolution operator like this `Cat::COLOR`