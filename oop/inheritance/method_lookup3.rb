module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color

# This example is similar to the last two. We created a new Bird object,
# assign it to a local variable named bird1. We then invoke the color method
# on the object we just created.

# The Bird class has no color method defined within it. But in this case we
# do have a module, Flyable, so Ruby checks that module.

# The Flyable module does not have a method named color. Flyable was the only
# module mixed into Bird, so Ruby will now check the superclass of Bird, Animal.

# This class does have a method named `color`, so Ruby will stop searching
# and will invoke the color method defined in Animal.c