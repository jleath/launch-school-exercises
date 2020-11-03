module Transportation
  class Vehicle; end
  class Truck < Vehicle; end
  class Car < Vehicle; end
end

# This is an example of using modules as namespaces, which helps
# to avoid name collisions within a codebase.

# We can access either of the three classes defined in the module using
# the scope resolution operator, as shown below:

puts Transportation::Vehicle
puts Transportation::Truck
puts Transportation::Car