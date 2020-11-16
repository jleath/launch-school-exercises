def group(collection)
  yield(collection)
end

birds = %w(raven finch hawk eagle)

group(birds) do |_, _, *raptors|
  p raptors
end