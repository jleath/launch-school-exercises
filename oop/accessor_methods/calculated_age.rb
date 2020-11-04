class Person
  AGE_SCALING = 2
  
  def age=(new_age)
    @age = new_age * AGE_SCALING
  end

  def age
    @age * AGE_SCALING
  end
end

person1 = Person.new
person1.age = 20
puts person1.age

# We need to define a custom setter method and a custom getter method.
# We start by defining a class constant named AGE_SCALING which is initialized
# to 2. We then define a method named `age=`, which multiplies it's argument
# by AGE_SCALING before assigning it to the @age instance variable.

# We do something similar for the getter method, in that we multiply the @age
# instance variable by AGE_SCALING before returning it. We are not modifying the
# value of @age within the getter method, because that would not be logically
# consistent with what we expect a getter method to be.