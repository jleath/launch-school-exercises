class SecretHandshake
  GESTURES = ["wink", "double blink", "close your eyes", "jump"]
  REVERSE_COMMANDS = Proc.new { |handshake, _| handshake.reverse }
  ADD_COMMAND = Proc.new do |handshake, gesture_index| 
    handshake + [GESTURES[gesture_index]] 
  end
  COMMANDS = [ADD_COMMAND] * 4 + [REVERSE_COMMANDS]

  def initialize(encoding)
    if encoding.instance_of?(Integer)
      @binary_string = convert_to_binary_string(encoding)
    elsif encoding.instance_of?(String)
      @binary_string = valid_binary_string?(encoding) ? encoding : "0"
    else
      raise ArgumentError, 'Invalid argument to constructor'
    end
  end

  def commands
    command_codes = @binary_string.reverse.chars
    command_codes.each_index.reduce([]) do |handshake, index|
      if command_codes[index] == '1'
        COMMANDS[index].call(handshake, index)
      else
        handshake
      end
    end
  end

  private

  def convert_to_binary_string(value)
    value.to_s(2)
  end

  def valid_binary_string?(string)
    string.size < 5 && string.match(/^(0|1)+$/)
  end
end