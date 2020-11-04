class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# line 16 will print 'Fluffy'
# line 17 will print 'My name is FLUFFY.
# line 18 will print 'FLUFFY'
# line 19 will print 'FLUFFY'