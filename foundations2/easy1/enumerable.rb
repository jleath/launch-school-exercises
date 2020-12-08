# To support the methods of Enumerable, we just need to define an each method
# and include the Enumerable module. The Enumerable module provides the other
# methods for us. They are all written to use each.
class Tree
  include Enumerable

  def each
  end
end