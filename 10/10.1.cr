numbers = File.read_lines("#{__DIR__}/input.txt").map(&.to_i).sort
numbers.unshift(0)
numbers.push(numbers.max + 3)

counts = numbers.each.cons_pair.map { |(x, y)| y - x }.tally
puts counts[1] * counts[3]
