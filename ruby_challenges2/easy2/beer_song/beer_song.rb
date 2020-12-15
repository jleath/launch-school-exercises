# Constructor takes no arguments, based on the examples it seems
# that this class would not need to maintain any state.

# verse instance method returns one verse of the song, using the
# argument as the number of beers

# verses returns a segment of the song, beginning with the number
# of beers defined by the first argument, returning a single string
# with each verse from that value down to and including the value
# defined by the second argument.

# lyrics returns the whole song, from 99 down to 0

# The lyrics are returned as newline separated lyrics.
# Format for each value will always be
# "{num_beers} bottle[s] of beer on the wall, {num_beers} bottle[s] of beer.\n"
# "Take (one|it) down and pass it around, {num_beers} bottles of beer on the wall.\n"

# If the value is 0, the verse changes quite a bit. It will always be:
# "No more bottles of beer on the wall, no more bottles of beer.\n"
# "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

# the value is 1, the second half of the verse changes and will be:
# "1 bottle of beer on the wall, 1 bottle of beer.\n"
# "Take it down and pass it around, no more bottles of beer on the wall.\n"

# These are the only two edge cases. Every other verse will be:
# "{num_beers} bottles of beer on the wall, {num_beers} bottles of beer.\n"
# "Take one down and pass it around, {num_beers} bottles of beer on the wall\n"

# We will define all of the logic in the verse instance method. The rest of the
# methods will delegate to this.

# For example, verses(50, 48) will result in the following method calls
# verse(50)
# verse(49)
# verse(48)
# the return values of these method calls will be concatenated into one string
# and then returned by the verses method

# lyrics will delegate to verses with the call verses(99, 0)

class ManyBeers
  def initialize(num_beers)
    @num_beers = num_beers
  end

  def verse
    "#{@num_beers} bottles of beer on the wall, #{@num_beers} bottles of beer.\n" \
    "Take one down and pass it around, #{@num_beers - 1} bottles of beer on the wall.\n"
  end
end

class NoBeers
  def verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class OneBeer
  def verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

class TwoBeers
  def verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end

class BeerSong
  def initialize
    @beers = [NoBeers.new, OneBeer.new, TwoBeers.new]
    (3..99).each { |beers| @beers << ManyBeers.new(beers) }
  end

  def verse(num_beers)
    @beers[num_beers].verse
  end

  def verses(start, stop)
    lyrics = (stop..start).reduce([]) do |result_str, num_beers|
      result_str.prepend(verse(num_beers))
    end
    lyrics.join("\n") 
  end

  def lyrics
    verses(99, 0)
  end
end