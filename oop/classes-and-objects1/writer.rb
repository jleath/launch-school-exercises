class Cat
  attr_reader :name
  attr_writer :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = "Harry"
kitty.greet

# Sometimes, we want to be able to modify an instance variable.
# From within an instance method, we can do this simply by 
# referencing the variable directly, like this:

# @name = new_name

# but what if we want to do that from outside of the class definition?

# we need to implement a "setter" method. There is another method that
# we can call that will create this method for us named `attr_writer`.

# We could also manually define a setter method, which is commonly useful
# if we have to do some other kind of processing along with changing the
# value of the instance variable.

# If we need to manually define the setter, we take advantage of some
# syntactic sugar. We define the method like this:

# def name=(new_name)
#   @name = name
# end

# The `name=` syntax tells Ruby that this is a setter method, and it
# gives us the ability to call the method using the familiar assignment syntax:

# kitty.name = "Harry"

# This code is equivalent to kitty.name=("Harry")