p File.read_lines("#{__DIR__}/input.txt")
  .map(&.tr("FBLR", "0101").to_i(2))
  .max
