puts File.read_lines("#{__DIR__}/input.txt").count { |line|
  spec, password = line.split(':').map(&.strip)
  counts, char = spec.split
  min, max = counts.split('-').map(&.to_i)
  min <= password.count(char[0]) <= max
}
