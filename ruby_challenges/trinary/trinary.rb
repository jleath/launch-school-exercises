require_relative 'number'

class Trinary < Number
  BASE = 3
  def initialize(value_string)
    super(value_string, base: BASE)
  end
end