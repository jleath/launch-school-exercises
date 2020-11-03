class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle; end

class Car < Vehicle; end

truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year

# In this example, we demonstrate class inheritance
# We start by defining a class named Vehicle. The Vehicle class has
# one instance method, year, and one getter method defined by the
# attr_reader method.

# We can inherit from the Vehicle class by typing `< Vehicle` after
# the name of our new classes. These subclasses will inherit the
# year instance variable and the getter method from Vehicle.