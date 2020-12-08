# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# On line 2, we use the `Kernel#proc` method (which is shorthand for
# 'Proc.new') to create a new Proc object. We pass a block into this
# method call which will define the behavior of this proc object. We 
# then assign this new Proc object to the local variable `my_proc`.

# On lines 3 and 4, we use the `puts` method to print some information
# about the `Proc` object assigned to `my_proc`. Line 3 will print
# the result of calling `to_s` on `my_proc`. Line 4 will print the class
# of the proc, which is obviously `Proc`. Both of these method calls will
# return nil.

# On line 5, we invoke the `call` method on `my_proc`. This will invoke
# the block passed into the `proc` call on line 2. We are not passing
# in an argument to the `call` method, so the block local variable `thing`
# will default to `nil`, and this method call will result in the output
# 'This is a .'. This is an example of the loose arity rules of Procs.
# Parameters for which no arguments are given will default to nil, and
# any additional arguments will simply be ignored.

# On line 6, we invoke the `call` method on `my_proc` again, but this time
# we are passing in an argument. The block defined on line 2 will be invoked,
# with the string "cat" passed into the block as an argument. Within the block,
# the block local variable `thing` will be assigned to the string "cat". We then
# invoke the `puts` method, which will use string interpolation to output
# "This is a cat.". The method, and therefore the block itself, will return nil.

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# This code example demonstrates the use of lambdas in Ruby. The first two lines
# demonstrate two different ways of creating a new lambda. One using the `Kernel#lambda`
# method, and another using shorthand provided by Ruby. In both cases, we define a block
# that will be executed when we invoke the `call` method on the lambda.

# The three calls to `puts` on lines 37-39 demonstrate two things. First, that both methods
# of defining a lambda will produce the same type of object. Second, that lambdas are actually
# Proc objects. In fact, there is no Lambda object defined in Ruby. Lambdas are just a form of
# Proc with unique semantics.

# Lines 40 and 41 demonstrate these unique semantics. The invocation of the `call` method on line
# 40 works as we expect because we are passing an argument in, which will then be passed into the
# block defined on line 35. This will result in the string "This is a dog." being output and will
# return nil.

# On line 41, we do not pass an argument to the `call` method. This will cause an `ArgumentError`
# to be raised. The semantics of lambdas do not allow us to invoke the lambda with the incorrect
# number of arguments. Plain Proc objects would let this execute and the block arguments would
# be default to nil.

# Line 42 demonstrates that there is no such thing as a `Lambda` object in Ruby. We cannot call
# `new` on `Lambda`.

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# This example demonstrates block arity rules and what happens if we `yield` without a block.
# On lines 68-70, we define a method named `block_method_1` that takes one parameter named
# `animal`. This method contains one single call to `yield` passing in no arguments.

# On line 72, we invoke the `block_method_1` method, passing in the string "seal" as well as
# an implicit block argument. When we invoke this method, it will immediately yield to the block
# argument. The block we passed in on line 72 expects an argument, but we do not give it one.
# The arity of rules of blocks dictate that this argument will default to nil. So when we invoke the
# `puts` method within the block, we will get the output "This is a .". We are using string
# interpolation to build the output string, which automatically calls `to_s` on any object between
# the `#{}`s. Calling `to_s` on a nil returns an empty string.

# One line 73, we invoke the `block_method_1` method again, passing in the string "seal" as an
# argument, but this time we do not pass in a block. When we invoke the `yield` method on line 69,
# Ruby will raise a `LocalJumpError`. We could prevent this error by changing line 69 to
# `yield if block_given?`. The `Kernel#block_given?` method returns true if a block was passed into
# the method from which `block_given?` was called.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# This example demonstrates several aspects of block arity rules. To start with, we define a method
# on lines 94-96 named `block_method_2`. This method takes one parameter named `animal`. Upon invocation,
# this method simply yields to a block, passing in the method's local variable `animal`. Since the call
# to `yield` is the last expression in the method, the return value of the block will be the return value
# of this method.

# On line 98, we invoke `block_method_2`, passing in the string `turtle` and a block that takes one
# parameter, `turtle`. `block_method_2` will yield to this block, passing it's string argument ("turtle")
# into the block. The block local variable `turtle` will be assigned the string "turtle" and then the block
# invokes the `puts` method to print out a string using string interpolation. The string "This is a turtle."
# will be output and the block (and therefore `block_method_2`) will return `nil`.

# On line 99, we invoke the `block_method_2` method again, passing in the string `turtle` and another block.
# This time, our block takes two parameters. Within the `block_method_2` method, we will only pass one argument
# into this block. Because of the block arity rules, this still works. The second parameter of the block will
# simply default to `nil` and the block will print "This is a turtle and a ." and then return `nil`.

# On line 102, we do the same thing, except this time our block takes zero parameters. Block arity rules dictate
# that any unneccessary arguments will simply be ignored. So the block will still execute. Within the block,
# we use string interpolation and a call to `puts` to attempt to print some output. The string interpolation
# references a variable named `animal`. The problem here is that there is no reference to `animal` in the block's
# binding. It was not passed into the block, nor was it in scope when the block was defined. So this call to
# `block_method_2` will result in a `NameError`.
