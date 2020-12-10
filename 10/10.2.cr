numbers = File.read_lines("#{__DIR__}/input.txt").map(&.to_i).sort
numbers.unshift(0)
numbers.push(numbers.max + 3)

nexts = numbers[...-1].each_with_index.to_h do |(n, i)|
  {n, numbers[i + 1..].take_while { |m| m - n <= 3 }}
end

possiblities = {numbers.last => 1_i64}
nexts.keys.reverse_each do |n|
  possiblities[n] = nexts[n].sum { |m| possiblities[m] }
end

puts possiblities[0]
