class Cat
  def initialize
    puts "I'm a cat!"
  end
end

kitty = Cat.new

# `initialize` is a constructor and is invoked whenever we instantiate
# a new object. Within the body of `Cat`, we define an instance method named
# initialize. Within this definition, we can output the string "I'm a cat!"
# This will be printed each time we instantiate a new Cat object.