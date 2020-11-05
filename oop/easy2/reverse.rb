class Transform
  def initialize(text)
    @text = text
  end

  def self.lowercase(text)
    text.downcase
  end

  def uppercase
    @text.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')