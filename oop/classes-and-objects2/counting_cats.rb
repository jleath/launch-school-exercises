class Cat
  @@number_of_cats = 0

  def self.total
    @@number_of_cats
  end

  def initialize
    @@number_of_cats += 1
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total

# This example demonstrates the usage of a class variable.
# Class variables differ from instance variables in that they are
# shared by all instances of the class.

# In the example above, we initialize a class variable called
# @@number_of_cats. The Cat class has only this one copy of this variable,
# which is shared by not only the objects of the Cat class, but also by any
# subclasses that may inherit from Cat.

# We want to increment this variable by 1 each time a Cat object is
# instantiated. Since the `initialize` constructor is called each time a
# Cat object is instantiated, so that seems like an obvious place to
# track the number of cats. Within the constructor, we will increment
# the @@number_of_cats variable.

# We also define a class method named total, that will return the value
# of the @@number_of_cats variable.