class MinilangError < StandardError; end

FLOAT_REGEX = /^\s*[+-]?((\d+_?)*\d+(\.(\d+_?)*\d+)?|\.(\d+_?)*\d+)(\s*|([eE][+-]?(\d+_?)*\d+)\s*)$/.freeze

class Minilang
  BINARY_OPERATIONS = { 'add' => :+, 'sub' => :-, 'mult' => :*,
                        'div' => :/, 'mod' => :% }.freeze
  CONTROL_OPERATIONS = %w[push pop print].freeze

  def initialize(instructions)
    @instructions = instructions
    @stack = []
    @register = 0
  end

  def eval(args = {})
    operations = format(instructions, args).downcase.split
    operations.each do |operation|
      eval_operation(operation)
    end
  rescue MinilangError => e
    puts e.message
  rescue KeyError
    puts "Invalid arguments to eval method: #{args}"
    exit
  end

  private

  def eval_operation(operation)
    if binary_op?(operation)
      eval_binary_op(operation)
    elsif control_op?(operation)
      send(operation)
    elsif valid_float?(operation)
      self.register = operation.to_f
    else
      raise MinilangError, "Invalid Token: #{operation}"
    end
  end

  attr_reader :stack
  attr_accessor :register, :instructions

  def eval_binary_op(instruction)
    op_symbol = BINARY_OPERATIONS[instruction]
    self.register = register.send(op_symbol, pop)
  end

  def valid_float?(value_str)
    !!(FLOAT_REGEX =~ value_str)
  end

  def binary_op?(instruction)
    BINARY_OPERATIONS.keys.include?(instruction)
  end

  def control_op?(instruction)
    CONTROL_OPERATIONS.include?(instruction)
  end

  def push
    stack.push(register)
  end

  def pop
    raise MinilangError, 'Attempt to pop from empty stack!' if stack.empty?

    self.register = stack.pop
  end

  def print
    puts register
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>f PUSH 9 MULT DIV PUSH 32 ADD PRINT'.freeze
Minilang.new(CENTIGRADE_TO_FAHRENHEIT).eval(degrees_c: 100)
# 212
Minilang.new(CENTIGRADE_TO_FAHRENHEIT).eval(degrees_c: 0)
# 32
Minilang.new(CENTIGRADE_TO_FAHRENHEIT).eval(degrees_c: -40)
# -40

FAHRENHEIT_TO_CENTIGRADE =
  '32 PUSH %<degrees_f>f SUB PUSH 9 PUSH 5 DIV MULT PRINT'.freeze
Minilang.new(FAHRENHEIT_TO_CENTIGRADE).eval(degrees_f: 212)
# 100
Minilang.new(FAHRENHEIT_TO_CENTIGRADE).eval(degrees_f: 32)
# 0
Minilang.new(FAHRENHEIT_TO_CENTIGRADE).eval(degrees_f: -40)
# -40

RECTANGLE_AREA =
  '%<width>f PUSH %<length>f MULT PRINT'.freeze
Minilang.new(RECTANGLE_AREA).eval(width: 12, length: 10)
# 120
Minilang.new(RECTANGLE_AREA).eval(width: -12, length: 10)
# -120
Minilang.new(RECTANGLE_AREA).eval(width: 12)
# Invalid Arguments
