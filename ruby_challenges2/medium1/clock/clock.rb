# A class method which takes two arguments, an integer value for the hour
# and an optional value for the minutes (which will default to 0).
# The hour argument is expected to be a 24-hour time and must be between 0 and 23
# The minute argument must be between 0 and 60
# This class method should instantiate an object of the class and return it.

# The Clock class also needs a to_s instance method, which returns a string
# in the format 'hh:mm'. The hours and minutes should be padded with 0s if needed.

# The Clock class should support the + operator, allowing the user to add
# minutes to the current time. If this causes the time to exceed, 23:59 it should
# wrap around to 0:00 and proceed

# The Clock class should support the - operator, allowing the user to subtract
# minutes from the current time. If this causes the time to go below 00:00, it should
# wrap around to 23:59 and proceed

# The Clock also needs to support the == operator, which will return true
# if two Clock objects are at the exact same time, and false otherwise.
class Clock
  HOURS_IN_DAY = 24
  MINUTES_IN_HOUR = 60
  MINUTES_IN_DAY = HOURS_IN_DAY * MINUTES_IN_HOUR

  class InvalidTimeError < StandardError; end

  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def initialize(hours, minutes)
    raise InvalidTimeError unless valid_hour?(hours) && valid_minute?(minutes)

    @time_code = (hours * 60) + minutes
  end

  def ==(other)
    time_code == other.time_code
  end

  def +(minutes)
    self.time_code = (self.time_code + minutes) % MINUTES_IN_DAY 
    self
  end

  def -(minutes)
    self.+(-minutes)
  end

  def to_s
    format("%02d:%02d", *time_code.divmod(60))
  end

  private

  def valid_hour?(hours)
    (0..23).cover?(hours)
  end

  def valid_minute?(minutes)
    (0..59).cover?(minutes)
  end

  protected
  attr_accessor :time_code
end
