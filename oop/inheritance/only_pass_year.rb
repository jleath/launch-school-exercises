class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type

  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
  end
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type

# In this example, we demonstrate how we can use the super method to only
# forward specific arguments to the superclass method.

# We have defined two subclasses of vehicle, Truck and Car.
# We want Car to keep only the functionality inherited from Vehicle. But we
# want to add some functionality to the Truck class: a new instance variable named
# bed_type. 

# We do this by overriding the initialize method in the Truck class. This new method
# takes two parameters, year and bed_type. We want to use the initialize method from
# Vehicle for setting up the @year instance variable and any other functionality inside
# the Vehicle#initialize method. So, we call super, passing in only year as an argument.
# Once this completes, we manually assign the bed_type argument to an instance variable
# named @bed_type.

# We also need to access Truck's @bed_type instance variable from outside the class,
# so we will need a getter method. We create this method using the attr_reader method.

# We don't have to make any changes to the Car class, as it will inherit all needed
# functionality from Vehicle.