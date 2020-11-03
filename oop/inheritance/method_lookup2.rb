class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

# In this example, we follow the same process in the previous example.

# The difference comes when we check the Animal class for a method named `color`.
# We don't have a getter method defined this time, so Ruby has to keep checking.
# It will check the Object class, the Kernel module, and then the BasicObject class.
# It will stop after it checks the BasicObject class because this is the class
# at the top of the inheritance hierarchy and does not inherit from any other classes

# None of these classes/modules have a method named `color`, so Ruby raises a
# NoMethodError and our program crashes.