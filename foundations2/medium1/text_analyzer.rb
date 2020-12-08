class TextAnalyzer
  def process
    text = yield
    puts "#{count_paragraphs(text)} paragraphs"
    puts "#{count_lines(text)} lines"
    puts "#{count_words(text)} words"
  end

  private

  def count_paragraphs(text)
    paragraphs = text.split("\n\n")
    paragraphs.reject! { |paragraph| paragraph.match(/^\s$/) }
    paragraphs.size
  end

  def count_lines(text)
    lines = text.split("\n")
    lines.size
  end

  def count_words(text)
    words = text.split
    words.size
  end
end

analyzer = TextAnalyzer.new
file = File.open('sample_text.txt', 'r')
analyzer.process { file.read }
file.close