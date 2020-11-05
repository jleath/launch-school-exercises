class GuessingGame
  VALUE_RANGE = 1..100
  MIN_VALUE = 1
  MAX_VALUE = 100
  MAX_GUESSES = 7

  def initialize
    @num_guesses = 0
    @value = nil
  end

  def play
    reset
    guess = nil

    loop do
      if out_of_guesses?
        puts "You have no more guesses. You lost!"
      elsif correct_guess?(guess)
        puts "You won!"
        break
      else
        guess = prompt_for_guess
        @num_guesses += 1
        display_guess_result(guess)
        puts ''
      end
    end

  end

  private

  def prompt_for_guess
    response = ''
    puts "You have #{MAX_GUESSES - @num_guesses} guesses remaining."
    loop do
      print "Enter a number between #{MIN_VALUE} and #{MAX_VALUE}: "
      response = gets.chomp
      break if valid_int?(response) && guess_within_range(response.to_i)

      print "Invalid guess. "
    end
    response.to_i
  end

  def valid_int?(input)
    input =~ /\A[-+]?\d+\z/
  end

  def guess_within_range(guess)
    guess.between?(MIN_VALUE, MAX_VALUE)
  end

  def display_guess_result(guess)
    if guess < @value
      puts "Your guess is too low."
    elsif guess > @value
      puts "Your guess is too high."
    else
      puts "That's the number!"
    end
  end

  def correct_guess?(guess)
    !guess.nil? && guess == @value
  end

  def out_of_guesses?
    @num_guesses == MAX_GUESSES
  end

  def player_won?
    @player_guess == @value
  end

  def reset
    @num_guesses = 0
    @value = rand(MIN_VALUE...MAX_VALUE)
  end
end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!