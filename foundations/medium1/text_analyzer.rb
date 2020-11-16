class TextAnalyzer
  def initialize(filename)
    @filename = filename
  end

  def process
    File.open(@filename, "r") { |file| yield(file.readlines) }
  end
end

count_paragraphs = Proc.new do |txt_lines|
  txt_lines.select { |line| line.squeeze("\n") == "\n" }.size + 1
end

count_lines = Proc.new do |txt_lines|
  txt_lines.size
end

count_words = Proc.new do |txt_lines|
  txt_lines.join('').split.size
end

filename = (ARGV.size == 0 ? "sample_text.txt" : ARGV[0])
analyzer = TextAnalyzer.new(filename)
puts "#{analyzer.process(&count_paragraphs)} paragraphs"
puts "#{analyzer.process(&count_lines)} lines"
puts "#{analyzer.process(&count_words)} words"