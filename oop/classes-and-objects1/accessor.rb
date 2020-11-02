class Cat
  attr_accessor :name

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

# Ruby provides one other `attr_*` method that allows us to
# define both a getter and a setter at once. 

# We've replaced the `attr_writer` and `attr_reader` method calls with one
# call to the `attr_accessor` method.

# This code is functionally equivalent to the previous code example.