class School
  def initialize
    @grades = []
    @sorted = true
  end

  # return a hash mapping grades to lists of students.
  # the keys of the resulting hash must be sorted in increasing order
  def to_h
    # need to get data in the form [[<grade>, <student_list>], ..]
    (0...@grades.size).each_with_object({}) do |grade_index, result|
      next if @grades[grade_index].nil?
      sort_students unless @sorted
      result[grade_index] = @grades[grade_index]
    end
  end

  # Return an array of student names that are in the grade indicated by 
  # grade_number
  def grade(grade_number)
    @grades[grade_number] || []
  end

  # Add a student_name to the indicated grade_number
  def add(student_name, grade_number)
    if @grades[grade_number].nil?
      @grades[grade_number] = [student_name]
    else
      @grades[grade_number] << student_name
      @sorted = false
    end
  end

  private

  def sort_students
    @sorted = true
    @grades.each_index do |index|
      @grades[index].sort! unless @grades[index].nil?
    end
  end
end
