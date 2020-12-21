class PalindromeProduct
  attr_reader :value, :factors
  def initialize(value)
    @value = value
    @factors = []
  end

  def add_factor_pair(factor_pair)
    @factors << factor_pair.sort
  end
end

class Palindromes
  DEFAULT_MIN_FACTOR = 1
  DEFAULT_MAX_FACTOR = 9999

  def initialize(max_factor: DEFAULT_MAX_FACTOR, min_factor: DEFAULT_MIN_FACTOR)
    @min_factor = min_factor
    @max_factor = max_factor
    @products = {}
  end

  def generate
    (@min_factor..@max_factor).each do |factor1|
      (factor1..@max_factor).each do |factor2|
        product = factor1 * factor2
        if palindromic?(product)
          add_product(product) unless @products.key?(product)
          @products[product].add_factor_pair([factor1, factor2])
        end
      end
    end
  end

  def largest
    @products[@products.keys.max]
  end

  def smallest
    @products[@products.keys.min]
  end

  private

  def add_product(product)
    @products[product] = PalindromeProduct.new(product)
  end

  def palindromic?(value)
    as_string = value.to_s
    as_string == as_string.reverse
  end
end