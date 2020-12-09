numbers = File.read_lines("#{__DIR__}/input.txt").map(&.to_i64)
index = (25...numbers.size).find { |i|
  numbers[i - 25...i]
    .each_combination(2)
    .all? { |(x, y)| x + y != numbers[i] }
}.not_nil!
number = numbers[index]
puts "Part 1: #{number}"

numbers.each_index do |i|
  sum = 0_i64
  (i...numbers.size).each do |j|
    sum += numbers[j]
    if sum == number
      puts "Part 2: #{numbers[i..j].minmax.sum}"
      exit
    elsif sum > number
      break
    end
  end
end
