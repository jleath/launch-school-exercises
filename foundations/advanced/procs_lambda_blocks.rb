# Group 1
# creating a new Proc object which takes one parameter and when executed
# will use string interpolation to print out "This is a " followed by the
# result of calling to_s on the argument and then a single '.'
my_proc = proc { |thing| puts "This is a #{thing}." }
# will print my_proc.to_s
puts my_proc
# will print Proc
puts my_proc.class
# execute the block that was passed into the proc method when we created this
# Proc object. Will print "This is a ." because we are not passing in an argument.
# The block parameter thing will default to nil and calling to_s on nil returns ''
my_proc.call
# execute the block that was passed into the proc method when we created this
# Proc object. Will print "This is a cat." because we are passing the string 'cat'
# into the block.
my_proc.call('cat')

# Group 2
# Creating a new Lambda object which takes on parameter and when executed
# will use string interpolation to print out "This is a " followed by the
# result of calling to_s on the argument and then a single '.'
my_lambda = lambda { |thing| puts "This is a #{thing}." }
# Creates another new lambda, which has the exact same functionality as the
# first lambda. Just uses an alternative syntax.
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# print the result of calling to_s on my_lambda
puts my_lambda
# print the result of calling to_s on my_second_lambda
puts my_second_lambda
# print Proc, lambdas are apparently not real objects. They are just an alternative syntax
# for defining a Proc?
puts my_lambda.class
# execute the block that was passed into the lambda when it was created.
# Will print "This is a dog.".
my_lambda.call('dog')
# execute the block that was passed into the lambda when it was created.
# This will fail and raise an ArgumentError, because unlike blocks and procs
# lambdas apparently cannot be called without the correct arguments.
# my_lambda.call
# Thi will fail with a NameError because Lambda is not a class.
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Group 3
# This is a method that takes one parameter named animal.
# all we do within this method is yield to the block that may have been
# passed in. If no block is passed in, a LocalJumpError will be raised
def block_method_1(animal)
  yield
end

# invoke the method defined above, passing in the string 'seal' as an argument.
# We are also passing in a block which takes one parameter and prints a string
# Will output This is a .
# Within the block_method_1 definition, we are yielding to the block without
# passing an argument. So the block local variable seal will be initialized to nil.
block_method_1('seal') { |seal| puts "This is a #{seal}."}
# invoke the method again without passing in a block, will raise a LocalJumpError
# block_method_1('seal')

# Group 4
# Defining a method which takes one parameter. Within this method, we yield to
# the block that may have been passed in, forwarding the method's argument to the
# block.
def block_method_2(animal)
  yield(animal)
end

# invoke block_method_2 passing in the string 'turtle' as an argument. This string
# will be yielded to the block that follows the method invocation.
# Will output "This is a turtle."
block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# Invoke the block_method_2 again, this time we are passing in a block that takes TWO
# arguments. Within our block_method_2 definition, we are only yielding one argument to the
# block. So the block local variable seal will default to nil. This will output
# This is a turtle and a .
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# Invoke the block_method_2 a third time. This time the block we are passing in
# does not take any arguments. Within the block we reference the variable animal,
# since there is no block local variable with this name, the block will look at its
# binding to see if any of the names that were visible when the block was defined 
# match animal. It won't so this will raise a NameError.
# block_method_2('turtle') { puts "This is a #{animal}."}

# Final Thoughts

=begin
Procs, lambdas and blocks are all ways that Ruby implements Closures.
A closure is a chunk of code that can be passed around and executed at will.
A notable feature of closures is that they keep a reference to the names that were
available at the time they were created. We call these references the closure's binding.

Blocks are purely anonymous and cannot be directly assigned to a variable.
We pass blocks into methods, either implicitly or explicitly (although when we do it 
explicitly we're not technically using a block anymore, but I'll come back to that).

Blocks are used by using the keyword yield from within the method which received the block.
We can pass arguments into blocks. The rules that dictate how arguments are handled (Arity) is different
than regular methods. If we don't pass in enough arguments, parameters that didn't receive arguments
will be initialized to nil. If we pass in too many arguments, the extra arguments are just ignored.
We can return values and mutate objects from within blocks. One interesting thing to note is that returning
from a block also returns from the method which called it.

A Proc is similar to a block, but we can assign Procs to a variable. To execute the code contained within
a block, we can either use the yield keyword or invoke the Proc#call instance method.

We can convert between procs and blocks using the & operator. When we define a method signature, we can capture
a block as a proc by prepending the parameter name with &. We can also convert a proc to a block by adding a & to the
beginning of the variable name when we pass an object into a method. This has to be the last argument though.

We can create a proc from an existing method using symbols and the & operator (again). When you apply the & to a symbol
in a method signature it invokes that symbols #to_proc method, and that proc will be passed in as the argument.

Lambdas are a special type of proc. They are not a separate class, but there is a different syntax for creating
them. They also have more strict argument checking, similar to a plain method. The arguments have to match.

The way lambdas handle breaks and returns is different too. If you return from a lambda, it does NOT break from
the method which invoked the lambda.

You can determine whether a Proc is a lambda or not using the lambda? instance method.
=end