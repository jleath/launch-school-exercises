class Banner
  def initialize(message, padding=1)
    @message = message
    @padding = padding
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    '+' + ('-' * inner_length) + '+'
  end

  def empty_line
    '|' + (' ' * inner_length) + '|'
  end

  def message_line
    '|' + (' ' * @padding) + @message + (' ' * @padding) + '|'
  end

  def inner_length
    @message.length + (@padding * 2)
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
puts Banner.new('')
puts Banner.new('This is a banner', 3)