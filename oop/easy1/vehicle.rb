class Vehicle
  DEFAULT_WHEELS = 4
  attr_reader :make, :model, :wheels

  def initialize(make, model)
    @make = make
    @model = model
    @wheels = self.class::DEFAULT_WHEELS
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
end

class Motorcycle < Vehicle
  DEFAULT_WHEELS = 2
end

class Truck < Vehicle
  DEFAULT_WHEELS = 6
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
end

truck = Truck.new("whatever", "whatever", "who_cares")
puts truck.wheels