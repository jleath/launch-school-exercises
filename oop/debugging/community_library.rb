class Library
  attr_accessor :address, :phone, :books

  def initialize(address, phone)
    @address = address
    @phone = phone
    @books = []
  end

  def check_in(book)
    books.push(book)
  end
end

class Book
  attr_accessor :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def display_data
    puts "---------------"
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "ISBN: #{isbn}"
    puts "---------------"
  end
end

community_library = Library.new('123 Main St.', '555-232-5652')
learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

community_library.check_in(learn_to_program)
community_library.check_in(little_women)
community_library.check_in(wrinkle_in_time)

community_library.books.each { |book| book.display_data }

# In this example, we instantiate four Book objects and a Library object.
# We invoke the `check_in` method on our Library object, once for each book.
# This has the effect of adding each of the books into the Library's `@books` instance variable
# which is an array that was initialized to [] in the constructor of Library.

# On line 42, we call the `books` getter method on the Library object, which returns
# an array of the books that have been "checked in" to that library.

# We then attempt to invoke `display_data` on that array object, but Array objects do
# not have a display_data method, so Ruby will raise a NoMethodError and the program
# will crash.

# We can fix this by calling the each method on the result of the `books` call,
# passing in a block in which we invoke display_data on each book in that array.c