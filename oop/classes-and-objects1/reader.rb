class Cat
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
puts kitty.name

# by default, all instance variables are inaccessible from outside of the class
# we can provide instance methods that return the value of instance variables,
# we call these methods "getter" methods. Typically, we just name the method
# after the variable which it retrieves.

# In this example, we create a getter method named `name`. Within, the body
# of this method, we simply reference the `@name` instance variable, which
# then becomes the return value of the `name` method.

# We can update the `greet` method to invoke this method, instead of referencing
# `@name` directly.

# Alternatively, we could use the `attr_reader` method to have Ruby
# automatically create a getter method for us. We would use the `attr_reader`
# method like this:

# attr_reader :name

# This has the same effect as manually defining a `name` method like we did
# in the code above.

# Now that we have a getter method, we can also access the instance variable
# from outside of the class.