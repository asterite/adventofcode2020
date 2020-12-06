p File.read_lines("#{__DIR__}/input.txt")
  .slice_when(&.empty?)
  .map(&.reject!(&.empty?).map(&.chars))
  .sum { |group|
    ('a'..'z').count { |letter|
      group.all? &.includes?(letter)
    }
  }
