class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify

# In this example, we define an instance method named `identify`.
# This method simply includes the keyword `self`.

# The value of the `self` keyword depends on the context in which it is used.
# When used in instance methods (as shown above), it evaluates to the object
# which called the method.

# In this example, we instantiate a new Cat object named kitty. We then invoke
# the method `identify` on kitty. The identify method will just return the object
# which called it, so it returns the object pointed to by `kitty`.

# passing in an object to the method `p` will print out a string representation
# of the object (without calling the to_s) method. This output will be an encoding
# of the object_id and the instance variables of that object.