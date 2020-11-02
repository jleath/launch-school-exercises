class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    self.name = new_name
  end
end

kitty = Cat.new('Sophie')
puts kitty.name
kitty.rename('Chloe')
puts kitty.name

# We can use a getter or setter method within another instance method
# If we use a setter method that has the same name as the instance variable
# we want to change, we have to prepend the call to the setter method with
# `self.`. 

# If we had written the rename method body as `name = new_name`, we would
# be initializing a local variable called `name` which would shadow the
# setter method. The instance variable would not be changed by this code.