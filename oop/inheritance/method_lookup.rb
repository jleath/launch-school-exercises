class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color

# On line 15, we call `new` on the Cat class, passing in the string
# 'Black' as an argument. This method invocation causes a new Cat
# object to be created and triggers the initialize method on that object.
# Since we passed the string 'Black' into the new method, that argument
# will be forwarded into the initialize method where it is then assigned
# to an instance variable named @color. This new Cat object is then assigned
# to a local variable named `cat1`

# We then invoke the instance method `color` on the object pointed to by `cat1`
# Ruby has to find this method, so it starts by checking the class of the object,
# which in this case is Cat.

# There is no method named `color` defined in the Cat class, so Ruby checks any
# modules that may have been included into Cat, last to first.

# Cat has no modules mixed in, so Ruby next checks the superclass of Cat. Cat inherits
# from Animal, so it checks that class. We can see that there is a getter method
# defined in the Animal class by the `attr_reader` method call on line 2.

# Since Ruby has found a matching method, it stops searching and invokes the `color`
# method defined in Animal.