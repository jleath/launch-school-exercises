def all?(collection)
  collection.each { |item| return false unless yield(item) }
  true
end

def any?(collection)
  collection.each do |item|
    return true if yield(item)
  end
  false
end

def none?(collection, &blk)
  !any?(collection, &blk)
end

def one?(collection)
  found_one = false
  collection.each do |item|
    if yield(item)
      return false if found_one
      found_one = true
    end
  end
  found_one
end
