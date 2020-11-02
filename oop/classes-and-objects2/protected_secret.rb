class Person
  attr_writer :secret

  def compare_secret(other_person)
    secret == other_person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)

# In this example, our `secret` method is a protected method.
# This is important for our `compare_secret` instance method.
# We obviously do not want the `secret` getter method to be accessible
# from outside of the class, otherwise we would just make the getter method
# public. But if we make the getter method private, we won't be able to
# invoke the method on the `other_person` object passed into `compare_secret`.

# That is how strict private methods are, we can't even access private methods
# of another instance of the same class.

# protected methods are different and the access they provide depends on where
# they are invoked. From within the class, protected methods act just like
# public methods and are accessible. From outside of the class, protected
# methods act just like private methods and are not accessible.

# Protected methods are not used very often, but this is one clear use case for
# them. It is not too uncommon to want to compare two objects of the same class.