class Cat
  def initialize(name)
    @name = name
    greet
  end

  def greet
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new("Sophie")

# We can also define behaviors for classes by defining instance methods
# In this example, we define an instance method named `greet` that we
# then call from within the `initialize` method. This method uses
# string interpolation to print a greeting.

# We can reference the instance variable `@name` from any instance method
# of a class because the instance variable exists as long as the object
# does.