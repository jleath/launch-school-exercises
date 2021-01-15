class WordProblem
  OPERATIONS = { 'plus' => '+', 'minus' => '-', 
                 'multipliedby' => '*', 'dividedby' => '/' }
  attr_reader :answer

  def initialize(text)
    @answer = parse(tokenize(text))
  end

  private

  def tokenize(text)
    instruction_text = text.downcase.match(/^what is (.*)\?$/)
    raise ArgumentError if instruction_text.nil?
    instruction_text = instruction_text.captures.first
    instruction_text.gsub(' by', 'by').split
  end

  def parse(tokens)
    begin
      result = tokens.shift.to_i
      until tokens.empty?
        op = OPERATIONS[tokens.shift]
        value = tokens.shift.to_i
        result = result.send(op, value)
      end
    rescue StandardError
      raise ArgumentError
    end
    result
  end
end