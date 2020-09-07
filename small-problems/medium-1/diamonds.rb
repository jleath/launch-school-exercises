def print_row(num_stars, width, hollow)
  if hollow && num_stars > 1
    puts "*#{' ' * (num_stars - 2)}*".center(width)
  else
    puts ('*' * num_stars).center(width)
  end
end

def print_up(n, hollow)
  num_stars = 1
  while num_stars < n
    print_row(num_stars, n, hollow)
    num_stars += 2
  end
end

def print_down(n, hollow)
  num_stars = n - 2
  while num_stars > 0
    print_row(num_stars, n, hollow)
    num_stars -= 2
  end
end

def diamond(n, hollow=false)
  puts
  print_up(n, hollow)
  print_row(n, n, hollow)
  print_down(n, hollow)
end

diamond(1)
diamond(3)
diamond(9)
diamond(1, true)
diamond(3, true)
diamond(9, true)