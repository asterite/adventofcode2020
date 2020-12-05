p File.read_lines("#{__DIR__}/input.txt")
  .map(&.tr("FBLR", "0101").to_i(2))
  .sort
  .each.cons_pair
  .find { |x, y| x + 1 != y }.not_nil![0] + 1
