class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# database_handle should probably not be publically accessible. It is an implementation
# detail and it we expose it then we are locked into that particular implementation.