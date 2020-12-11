numbers = File.read_lines("#{__DIR__}/input.txt").map(&.to_i).sort
numbers.unshift(0)
numbers.push(numbers.max + 3)

counts = numbers.each.cons_pair.map { |(x, y)| y - x }.tally
puts "Part 1: #{counts[1] * counts[3]}"

possiblities = {numbers.last => 1_i64}
numbers[...-1].reverse_each.with_index do |n, i|
  p n, i
  nexts = numbers[i + 1..].take_while { |m| m - n <= 3 }
  possiblities[n] = nexts.sum { |m| possiblities[m] }
end

puts "Part 2: #{possiblities[0]}"
