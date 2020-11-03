class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year)
    super(year)
    start_engine
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year

# In this example, we demonstrate using super to call a method
# defined in the superclass. We want to add functionality to the
# initialize method of the Truck class, while keeping the existing
# functionality inherited from the Vehicle class.

# To do this, we override the initialize method. Within this method
# definition, we use super to call the constructor from the superclass.

# We pass the year argument into super so that it will be passed
# into the constructor defined in Vehicle. By default, if we leave
# the parantheses off of super, all arguments passed into the current method
# will be forwarded to the matching method found in the superclass.
# In this example, we could have used this feature, but instead we
# are manually choosing the argument(s) to forward.

# If there is no matching method in the superclass, Ruby will raise
# a NoMethodFound error and crash. Fortunately, we have an initialize method
# in Vehicle, so our Truck object is initialized according to the method defined
# in Vehicle. We then call the instance method start_engine which prints "Ready to go!"
# and returns nil