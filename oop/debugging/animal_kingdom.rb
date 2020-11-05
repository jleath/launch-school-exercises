class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

# The error in this code is caused by an incorrect usage of `super`.
# On line 37, in the `SongBird` class definition, we override the `initialize`
# method inherited from the `Bird` class.

# On line 37, we call `super` with no parentheses, which means that all THREE of
# the arguments from `SongBirds` `initialize` method will be forwarded to the
# `initialize` method of `Bird`.

# This causes an `ArgumentError` to be raised because the `Bird#initialize` method
# only takes two arguments. We can fix this by just explicitly stating which
# arguments should be forwarded, `diet` and `superpower`