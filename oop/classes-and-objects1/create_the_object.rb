class Cat
end

kitty = Cat.new

# we instantiate an object of a class by invoking the `new` class method
# on the class which defines the type we want.
# the `new` method triggers the `initialize` constructor in the class, which
# in this case takes no arguments.
# we assign this new `Cat` object to a local variable named `kitty`.