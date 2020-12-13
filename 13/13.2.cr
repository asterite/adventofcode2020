restrictions = File
  .read_lines("#{__DIR__}/input.txt")[1]
  .split(",")
  .each_with_index
  .reject { |(bus, minute)| bus == "x" }
  .map { |(bus, minute)| bus = bus.to_i64; {bus, minute.to_i64 % bus} }
  .to_a
  .sort_by { |(bus, minute)| -bus }

increment = restrictions[0][0]
target_index = 1
bus, minute = restrictions[target_index]
value = 0_i64 - restrictions[0][1]
while true
  mod = value % bus
  rest = mod == 0 ? 0 : (bus - mod)
  if rest == minute
    increment *= bus
    target_index += 1
    break if target_index == restrictions.size
    bus, minute = restrictions[target_index]
  else
    value += increment
  end
end
puts value
