class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    "#{super()} Drive #{speed} please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')

# This is another example of using the super method to invoke a
# method defined in a superclass. In this case, we want to retrieve
# the return value of a call to Vehicle.start_engine and then append
# another string to it.

# In the Truck#start_engine method, we will use super with parentheses,
# passing in 0 arguments so that no arguments are forwarded. We have to do
# this because our start_engine method defined in the Truck class takes one
# parameter, while start_engine in the superclass takes none.

# Once super finds the correct method and invokes it, we just use
# string interpolation to build a string from that result and the speed
# argument passed into Truck's start_engine method.