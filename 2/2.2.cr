puts File.read_lines("#{__DIR__}/input.txt").count { |line|
  spec, password = line.split(':').map(&.strip)
  indexes, char = spec.split
  indexes.split('-').map(&.to_i)
    .one? { |index| password[index - 1] == char[0] }
}
