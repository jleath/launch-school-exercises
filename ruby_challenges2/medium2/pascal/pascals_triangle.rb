class Triangle
  attr_reader :rows

  def initialize(num_rows)
    @rows = []
    build_triangle(num_rows)
  end

  private

  def build_triangle(num_rows)
    num_rows.times { |row_number| add_row(row_number) }
  end

  def add_row(row_number)
    if row_number == 0
      @rows.append([1])
    else
      curr_row = (1...row_number).map do |column_number|
        previous_row = @rows[row_number - 1]
        left_value = previous_row[column_number - 1]
        right_value = previous_row[column_number]
        left_value + right_value
      end
      @rows.append([1] + curr_row + [1])
    end
  end
end