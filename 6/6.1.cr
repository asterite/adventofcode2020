p File.read_lines("#{__DIR__}/input.txt")
  .slice_when(&.empty?)
  .sum(&.join.chars.uniq.size)
