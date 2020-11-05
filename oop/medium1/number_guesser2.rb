class GuessingGameError < StandardError; end

class GuessingGame
  VALUE_RANGE = 1..100

  def initialize(min_value, max_value)
    @num_guesses = 0
    @value = nil
    @min_value = min_value
    @max_value = max_value
    raise GuessingGameError, "Invalid range" if min_value >= max_value

    @max_guesses = Math.log2(max_value - min_value).to_i + 1
  end

  def play
    reset
    guess = nil

    loop do
      if correct_guess?(guess)
        puts "You won!"
        break
      elsif out_of_guesses?
        puts "You have no more guesses. You lost!"
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
    puts "You have #{@max_guesses - @num_guesses} guesses remaining."
    loop do
      print "Enter a number between #{@min_value} and #{@max_value}: "
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
    guess.between?(@min_value, @max_value)
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
    @num_guesses == @max_guesses
  end

  def player_won?
    @player_guess == @value
  end

  def reset
    @num_guesses = 0
    @value = rand(@min_value..@max_value)
  end
end

game = GuessingGame.new(501, 1500)
game.play
