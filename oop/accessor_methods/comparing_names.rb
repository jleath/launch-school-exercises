class Person
  attr_accessor :first_name
  attr_writer :last_name

  def first_equals_last?
    first_name == last_name
  end

  private

  attr_reader :last_name
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?

# In this example, we are setting both the first_name and last_name
# instance variables from outside of the class. So we need a public
# setter method for both of these. We can get this by adding this code
# to the Person class

# attr_writer :first_name, :last_name

# We also need two getter methods, one for first_name and one for last_name
# The problem description states that we want the first_name getter to be
# available outside of the class, but not the last_name getter.

# To deal with the getter for the first_name getter, we can simply add this
# to the class.

# attr_reader :first_name

# We need to make a getter method for the last_name variable, but it needs to be
# inaccessible from outside the class, so we'll use the private method to define
# this getter. We need to make sure that we call the private method after we define
# our other accessor methods and the first_equals_last? method, so that those remain
# public.

# private
#
# attr_reader :last_name

# At this point, our code looks like this:

# class Person
#   attr_writer :first_name, :last_name
#   attr_reader :first_name
#
#   def first_equals_last?
#     first_name == last_name
#   end
#
#   private
#
#   attr_reader :last_name
# 
# end

# We can simplify some of this, we have a attr_reader and attr_writer
# call for first_name, we can use just one call to attr_accessor.
