map = File.read_lines("#{__DIR__}/input.txt")

slopes = [{1, 1}, {3, 1}, {5, 1}, {7, 1}, {1, 2}]
p slopes.product { |dx, dy|
  dy.step(to: map.size - 1, by: dy).with_index(1).count { |(y, i)|
    x = (i * dx) % map.first.size
    map[y][x] == '#'
  }.to_i64
}
