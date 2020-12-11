def simulate(grid, *, tolerance)
  grid, next_grid = grid.clone, grid.clone
  width, height = grid.first.size, grid.size
  directions = [-1, 0, 1].product([-1, 0, 1]).reject { |dx, dy| dx == 0 && dy == 0 }

  changed = true
  while changed
    changed = false

    grid.each_with_index do |row, y|
      row.each_with_index do |value, x|
        occupied = directions.sum do |dy, dx|
          (yield grid, x, y, dx, dy, width, height) ? 1 : 0
        end

        next_grid[y][x] =
          if value == 'L' && occupied == 0
            changed = true
            '#'
          elsif value == '#' && occupied >= tolerance
            changed = true
            'L'
          else
            value
          end
      end
    end

    grid, next_grid = next_grid, grid
  end

  grid.sum(&.count(&.==('#')))
end

grid = File.read_lines("#{__DIR__}/input.txt").map(&.chars)

part1 = simulate(grid, tolerance: 4) do |grid, x, y, dx, dy, width, height|
  0 <= y + dy < height && 0 <= x + dx < width && grid[y + dy][x + dx] == '#'
end
puts "Part 1: #{part1}"

part2 = simulate(grid, tolerance: 5) do |grid, x, y, dx, dy, width, height|
  seat_visible = false
  while !seat_visible && 0 <= y + dy < height && 0 <= x + dx < width
    x += dx
    y += dy
    value = grid[y][x]
    case value
    when '#' then seat_visible = true
    when 'L' then break
    end
  end
  seat_visible
end
puts "Part 2: #{part2}"
