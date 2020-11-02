module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.walk

# Modules are containers for behaviors. We can define a module with a 
# `walk` behavior (method) and grant those behaviors to a class by typing
# `include` followed by the name of the module in the class definition.

# This is called a mixin, because we are mixing in the behaviors defined
# in the module into the class.

# In this example, we mixin the module `Walkable` to the `Cat` class.
# Now, every instance of the `Cat` class has a `walk` instance method.