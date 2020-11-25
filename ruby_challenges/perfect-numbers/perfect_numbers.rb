class PerfectNumber
  def self.classify(n)
    raise ArgumentError, "n must be positive" unless n > 0

    divisors = get_divisors(n)
    sum = divisors.reduce(0, :+) - n
    case sum <=> n
    when 0 then 'perfect'
    when 1 then 'abundant'
    when -1 then 'deficient'
    end
  end

  private

  def self.get_divisors(n)
    divisors = []
    (1..n).each do |curr_divisor|
      quotient = n / curr_divisor
      break if curr_divisor >= quotient
      next unless (n % curr_divisor).zero?

      divisors.concat([curr_divisor, quotient])
    end
    divisors
  end
end