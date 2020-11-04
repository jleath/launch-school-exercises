class Banner
  PADDING = 1

  def initialize(message, width = nil)
    if width.nil? || width < message.size
      @width = message.size
    else
      @width = width
    end
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def inner_width
    @width + (PADDING * 2)
  end

  def horizontal_rule
    "+" + ("-" * inner_width) + "+"
  end

  def empty_line
    "|" + (" " * inner_width) + "|"
  end

  def message_line
    "| #{@message.center(@width)} |"
  end
end

banner = Banner.new("To boldly go where no one has gone before.")
puts banner

banner = Banner.new('', 5)
puts banner

banner = Banner.new('Hello!', 3)
puts banner

banner = Banner.new('Hello!', 20)
puts banner