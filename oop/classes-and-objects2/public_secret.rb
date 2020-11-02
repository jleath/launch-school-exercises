class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

# In this example, we are setting and retrieving the instance variable
# `secret` from outside of the class.

# This indicates that we need both a getter and a setter method for the
# @secret variable. We can get both of these by simply including a call
# to `attr_accessor`