input = [11, 0, 1, 10, 5, 19]
seen = input[...-1].each.with_index(1).to_h
last = input.last
(input.size + 1).upto(30_000_000) do |turn|
  previous_turn = seen[last]?
  seen[last] = turn - 1
  last = previous_turn ? turn - 1 - previous_turn : 0
  if turn == 2020
    puts "Part 1: #{last}"
  elsif turn == 30_000_000
    puts "Part 2: #{last}"
  end
end
