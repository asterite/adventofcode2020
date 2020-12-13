ealiest_time, buses = File.read_lines("#{__DIR__}/input.txt")
ealiest_time = ealiest_time.to_i
buses = buses.split(",").reject(&.==("x")).map(&.to_i)
puts buses
  .map { |bus| {bus, bus - (ealiest_time % bus)} }
  .min_by(&.[1])
  .product
