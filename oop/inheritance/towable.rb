module Towable
  def tow
    puts "I can tow a trailer!"
  end
end

class Truck
  include Towable
end

class Car
end

truck1 = Truck.new
truck1.tow

# Modules are useful as a collection of related behaviors that may be 
# useful to multiple classes. 

# In this example, we want to be able to give certain classes a specific 
# kind of behavior, the ability to tow trailers.

# We can put this functionality into a module named Towable, which we do on
# lines 1 through 5. We define a module using the keyword `module` followed
# by the name of the module. Within the module definition, we define a method
# named tow that simply prints out a message when invoked.

# We then use the include keyword in the Truck class to mixin the functionality
# from the Towable module. This is effectively like copy-pasting the code
# from the Towable module into the Truck class. Objects of type Truck now have
# an instance method named `tow`.