class Sieve
  attr_reader :primes, :limit

  def initialize(limit)
    @limit = limit
    @primes = generate_primes
  end

  # Return an array containing all of the primes up to and including @limit
  def generate_primes
    flags = [:prime] * (limit + 1)

    (2..@limit).each do |curr_value|
      next if flags[curr_value] == :composite

      (curr_value * 2..@limit).step(curr_value) do |to_mark| 
        flags[to_mark] = :composite 
      end
    end

    (2..@limit).select { |index| flags[index] == :prime }
  end
end