instructions = File
  .read_lines("#{__DIR__}/input.txt")
  .map { |line| {line[0], line[1..].to_i} }

x = y = 0
dir_x, dir_y = 1, 0

instructions.each do |action, value|
  case action
  when 'N' then y -= value
  when 'S' then y += value
  when 'E' then x += value
  when 'W' then x -= value
  when 'L' then (value//90).times { dir_x, dir_y = dir_y, -dir_x }
  when 'R' then (value//90).times { dir_x, dir_y = -dir_y, dir_x }
  when 'F' then x, y = x + dir_x*value, y + dir_y*value
  end
end

puts "Part1: #{x.abs + y.abs}"

ship_x, ship_y = 0, 0
waypoint_x, waypoint_y = 10, -1

instructions.each do |action, value|
  case action
  when 'N' then waypoint_y -= value
  when 'S' then waypoint_y += value
  when 'E' then waypoint_x += value
  when 'W' then waypoint_x -= value
  when 'L' then (value//90).times { waypoint_x, waypoint_y = waypoint_y, -waypoint_x }
  when 'R' then (value//90).times { waypoint_x, waypoint_y = -waypoint_y, waypoint_x }
  when 'F' then ship_x, ship_y = ship_x + waypoint_x*value, ship_y + waypoint_y*value
  end
end

puts "Part 2: #{ship_x.abs + ship_y.abs}"
