def get_raptors(arr)
  yield(arr)
end

get_raptors(%w(raven finch hawk eagle)) do |_, _, *raptors|
  p raptors
end
