mem = {} of String => UInt64
or_mask = 0_u64
xs = [] of Int32

File.open "#{__DIR__}/input.txt", &.each_line do |line|
  case line
  when /mask = (\w+)/
    mask = $1
    or_mask = mask
      .each_char
      .with_index
      .select { |(char, i)| char == '1' }
      .sum { |(char, i)| 1_u64 << (35 - i) }
    xs = mask
      .each_char
      .with_index
      .select { |(char, i)| char == 'X' }
      .map { |(char, i)| 35 - i }
      .to_a
  when /mem\[(\d+)\] = (\d+)/
    address, value = $1.to_u64, $2.to_u64
    address |= or_mask
    0.upto(xs.size) do |i|
      xs.each_combination(i) do |combination|
        masked_address = address
        xs.each do |x|
          if combination.includes?(x)
            masked_address |= 1_u64 << x
          else
            masked_address &= ~(1_u64 << x)
          end
        end
        mem[masked_address.to_s] = value
      end
    end
  end
end

puts mem.values.sum
