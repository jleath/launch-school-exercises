class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{name}"
  end
end

kitty = Cat.new("Sophie")

# Classes can be defined so that objects of that class type will have instance
# variables. Instance variables are prefixed with the @ symbol.

# In this case, a Cat object has an instance variable named @name.

# We can define `initialize` so that it takes whatever parameters we choose.

# In this case, we define `initialize` to take one parameter named `name`.

# Within the `initialize` method, we assign the argument name to the instance
# variable @name. Unlike local variables, instance variables persist even after
# the method is finished executing.

# We then use string interpolation to output a greeting from the new Cat object
# that includes the argument we pass into the `new` method.