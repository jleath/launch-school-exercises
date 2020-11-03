module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  include Towable
end

class Car < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car.new(2006)
puts car1.year

# In this example, we see that modules can work in tandem with class
# inheritance. We have a superclass named Vehicle, with an initializer
# and a getter method for the `year` instance variable.

# Car and Truck both inherit from the Vehicle class, granting them both
# the initializer and getter method from Vehicle.

# Since we have mixed the Towable module into the Truck class, objects of
# type Truck have an additional method available to them named `tow`, which
# is defined in the Towable module