puts File.read_lines("#{__DIR__}/input.txt")
  .map(&.to_i)
  .each_combination(2, reuse: true)
  .find { |array| array.sum == 2020 }
  .not_nil!
  .product
