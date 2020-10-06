# return a list of the keys in POCKETS that are associated with values that are
# NOT found in ALLOWED_ITEMS

# the values in the pockets hash may be empty arrays or nil objects
# if nobody has disallowed items in their pockets, return nil
# if there are no allowed items, return all pocket keys with any items

# initialize an empty "suspects" array
# for each entry in the pockets hash
#   if the value array has any items not included in allowed_items
#     add the current key to the suspects array
# return the suspects array  

def find_suspects(pockets, allowed_items)
  suspects = []
  pockets.each do |name, items|
    items.each do |item|
      suspects << name unless allowed_items.include?(item)
    end
  end
  return nil if suspects.empty?
  suspects.uniq
end

pockets = {
  bob: [1],
  tom: [2, 5],
  jane: [7]
}

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]