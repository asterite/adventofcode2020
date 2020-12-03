map = File.read_lines("#{__DIR__}/input.txt")
puts 1.upto(map.size - 1).count { |y|
  x = (y * 3) % map.first.size
  map[y][x] == '#'
}
