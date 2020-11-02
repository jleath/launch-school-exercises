class Cat
  attr_reader :name

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def personal_greeting
    puts "Hello! My name is #{name}!"
  end

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting

# This example shows the syntactical difference between defining a class method
# and an instance method. We can see that for class methods, we must prepend the
# method name with `self.`.

# Since the Cat class has a getter method for the @name variable, we use that
# in the personal_greeting method. We use string interpolation to convert the
# return value of the name method call into a string.

# Also note that `generic_greeting` is called on the `Cat` class itself, while
# `personal_greeting` is called on an instance of the `Cat` class.