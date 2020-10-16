class Cat
  attr_reader :name
  FUR_COLOR = 'purple'

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{FUR_COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet