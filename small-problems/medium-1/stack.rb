# input: a string representing instructions to the stack machine
# output: the integer value resulting from executing the instructions in the input

# Need two variables to maintain the state of the stack
#  - An array for the stack
#  - A single integer for the register
# The stack array will be initialized to an empty array
# The register variable will be initialized to 0

# The stack machine should be able to perform the following commands
#  - n - place the value represented by n into the register
#  - PUSH  - copy the value in the register onto the top of the stack
#  - POP   - remove the top value of the stack and overwrite the register value with it
#  - ADD   - pop the top value from the stack, add it to the register, store result in register
#  - SUB   - pop the top value from the stack, subtract it from the register, store result in register
#  - MULT  - pop the top value from the stack, multiply it by register value, store result in register
#  - DIV   - pop the top value from the stack, divide the register value by it, store result in register (integer division)
#  - MOD   - pop the top value from the stack, divide the register value by it, store the remainder in the register
#  - PRINT - print the register value

# initialize stack and register
# convert the instructions into an array
# for each token in the array
#   if token is an integer, convert the string to integer and update the register
#   if token is a print instruction, print the register value, do not change any state
#   otherwise, perform the requested operation, updating stack and register as needed

BAD_POP_MSG = 'Attempt to pop from an empty stack!'

def error_string(message, instruction_no, token)
  "#{message} Instruction ##{instruction_no} (#{token})"
end

def eval_op(stack, register, token_no, token)
  if stack.empty?
    return error_string(BAD_POP_MSG, token_no, token)
  end
  result = register
  case token
  when 'POP'   then result = stack.pop
  when 'ADD'   then result += stack.pop
  when 'SUB'   then result -= stack.pop
  when 'MULT'  then result *= stack.pop
  when 'DIV'   then result /= stack.pop
  when 'MOD'   then result %= stack.pop
  end
  result
end

def minilang(instructions)
  stack = []
  register = 0
  instructions.split.each_with_index do |token, index|
    if token == 'PRINT'
      puts "#{register}"
    elsif token == 'PUSH'
      stack.push(register)
    elsif token.chars.all? { |c| c.count('0-9-') == 1 }
      register = token.to_i
    else
      register = eval_op(stack, register, index, token)
      if register.is_a?(String)
        puts register
        return nil
      end
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# (3 + (4 * 5) - 7) / (5 % 3)
# (/ (- (+ 3 (* 4 5)) 7) (% 5 3))
minilang('3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 ADD SUB DIV PRINT')