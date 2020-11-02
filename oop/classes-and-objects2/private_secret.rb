class Person
  attr_writer :secret
  
  def share_secret
    puts secret
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret

# In this example, our getter method is private. This means we cannot
# access this getter method from outside of the class. We will define
# a new public method named share_secret, that will invoke the private
# `secret` getter and print the result of that invocation.

# We can call the `secret` getter method from `share_secret` because
# private methods are still accessible from within the class.