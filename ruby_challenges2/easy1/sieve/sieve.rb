class Sieve
  attr_reader :primes

  def initialize(limit)
    @limit = limit
    @primes = build_primes
  end
  
  private

  def build_primes
    values = [nil] * (@limit + 1)
    (2..@limit).each do |current_value|
      next unless values[current_value].nil?

      values[current_value] = :prime
      mark_multiples!(values, current_value)
    end
    values.each_index.select { |index| values[index] == :prime }
  end

  def mark_multiples!(values, base)
    (base * 2...values.size).step(base) do |to_mark|
      values[to_mark] = :composite
    end
  end
end