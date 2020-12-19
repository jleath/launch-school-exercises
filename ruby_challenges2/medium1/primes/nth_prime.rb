class Prime
  def self.nth(n)
    raise ArgumentError if n == 0

    prime_list = [2]
    next_value = 3

    while prime_list.size < n
      prime_list.each do |prime|
        break if (next_value % prime).zero?

        if prime > Math.sqrt(next_value)
          prime_list << next_value
          break
        end
      end
      next_value += 2
    end
    prime_list[n - 1]
  end
end