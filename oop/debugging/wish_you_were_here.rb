class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  def ==(other)
    latitude == other.latitude && longitude == other.longitude
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false

# On line 39, we are calling the `==` method on a GeoLocation object.
# We have not defined this method for that class so by default it will
# use the `==` method defined in `BasicObject`. This method compares object ids
# and will only return true if the caller and the argument are the same object.

# We can override the `==` method in the `GeoLocation` class. Within this method
# we will use the `Float#==` method to do the comparison for us. We need to call this
# method on both the `latitude` and `longitude` instance variables.
