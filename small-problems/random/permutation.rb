def permute_sums(a, k, n)
  if n == a.size
    return 0
  elsif k > 0
    return [a[n]].append(permute_sums(a, k-1, n+1))
  else
    return [a[n]]  
  end
end

test = [0, 1, 2]
p permute_sums(test, 1, 0)