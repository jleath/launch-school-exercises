class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

# Here we define a class method named `generic_greeting`
# A class method differs from an instance method in that it is
# invoked on the class itself, rather than on an instance of the class

# class methods have no ability to directly access instance variables or methods

# class methods cannot be invoked on an instance of the class, they must
# be invoked on the class itself. We can still call the class method by
# chaining it to a call to the `class` instance method

kitty = Cat.new
kitty.class.generic_greeting

# We invoke the class method on the local variable kitty, this returns the class
# that defines the type of kitty, which in this case is Cat.
# The method generic_greeting is then invoked on the return value of the class method.
# so kitty.class.generic_greeting is equivalent to Cat.generic_greeting