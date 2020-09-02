MAX_TERM_WIDTH = 40

def wrap_string(str, max_length)
  text_lines = []
  if str.size < MAX_TERM_WIDTH
    return [str]
  end

  words = str.split
  curr_word = 0
  line_text = '' 
  curr_line = 0

  loop do 
    break if curr_word >= words.size

    curr_length = line_text.length
    next_word = words[curr_word]
    # if in the middle of a line of text and the next word 
    # will exceed the maximum width
    if !line_text.empty? && (curr_length + next_word.size) > max_length
      text_lines[curr_line] = line_text.chop.center(max_length)
      line_text = ''
      curr_line += 1
    # if at the beginning of a line of text and the next word
    # will exceed the maximum width
    elsif line_text.empty? && words[curr_word].size > max_length
      text_lines[curr_line] = words[curr_word].slice!(0, max_length)
      curr_line += 1
    # otherwise, can just add the next word to the current line of text
    else
      line_text += words[curr_word] + ' '
      curr_word += 1
    end
  end
  # make sure to push the last line of text into the lines array
  text_lines[curr_line] = line_text.chop.center(max_length)
  text_lines
end

def build_horizontal_border(inner_width)
  "+#{'-' * inner_width}+"
end

def build_nontext_row(inner_width)
  "|#{' ' * inner_width}|"
end

def build_text_row(line_text, padding)
  "|#{' ' * padding}#{line_text}#{' ' * padding}|"
end

def border_row?(curr_row, num_rows)
  curr_row == 0 || curr_row == num_rows - 1
end

def nontext_row?(curr_row, padding, num_text_lines)
  curr_row <= padding || curr_row > (padding + num_text_lines)
end

def print_in_box(str, padding=1)
  total_padding = padding * 2
  max_line_length = MAX_TERM_WIDTH - total_padding
  num_border_rows = 2
  lines = wrap_string(str, max_line_length)
  num_text_lines = lines.size
  num_rows = total_padding + num_text_lines + num_border_rows
  num_columns = lines.first.size + total_padding + num_border_rows
  inner_width = num_columns - num_border_rows

  curr_row = 0
  while curr_row < num_rows
    if border_row?(curr_row, num_rows)
      puts build_horizontal_border(inner_width)
      curr_row += 1
    elsif nontext_row?(curr_row, padding, num_text_lines)
      puts build_nontext_row(inner_width)
      curr_row += 1
    else
      lines.each do |line|
        puts build_text_row(line, padding)
        curr_row += 1
      end
    end
  end
end

loop do
  puts "Enter some text and I'll make it pretty. Or type Ctrl-C to quit."
  input = gets.chomp.rstrip
  print_in_box(input)
  puts 
end