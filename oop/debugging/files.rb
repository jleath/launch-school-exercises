class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post

# On line 19, within the `File` class definition, we attempt to access a constant
# named `FORMAT`. Class constants have lexical scope, so Ruby starts looking for this
# constant in the `File` class, because that is where we used it. It will then check
# all enclosing scopes (in this case there are none), and then it will follow the
# method lookup path to find it.

# In this case, Ruby will not be able to find the FORMAT constant. We've defined it in
# all the subclasses of `File` so we presumably wanted each subclass of File to be able
# to access its own `FORMAT` constant from the `to_s` method it inherited from File.

# We can get this functionality by using `self.class::FORMAT` instead of just `FORMAT`
# This way when the `to_s` method is called on a object with a type that inherits from
# File, we can still use the method inherited from File and Ruby will know explicitly
# where to look to find the right constant.