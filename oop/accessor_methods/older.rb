# age should only be accessible to instances of Person

class Person
  attr_writer :age

  def older_than?(other)
    age > other.age
  end

  protected

  attr_reader :age
end

person1 = Person.new
person1.age = 17

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)

# We can see on lines 10 and 13 that we need a public setter method
# for age. We can add this with a simple call to attr_writer. Without using
# any access modifiers.

# We can also see on line 5, that we need a getter method for age.
# But the problem description states that the getter method for age
# should only be accessible to an instance of Person.

# We can't just make this getter method private, because we are calling the
# age getter on another Person object from within an instance method.

# When a method is private, that means it is not accesible by anybody except the
# object itself.

# We can use the protected access modifier instead. Protected methods behave as though 
# they are private from outside the class, but public from within the class definition.

