def mask(string, target_char)
  string
    .each_char
    .with_index
    .select { |(char, i)| char == target_char }
    .sum { |(char, i)| 1_u64 << (35 - i) }
end

mem = {} of Int32 => UInt64
and_mask = UInt64::MAX
or_mask = 0_u64

File.open "#{__DIR__}/input.txt", &.each_line do |line|
  case line
  when /mask = (\w+)/
    or_mask = mask($1, '1')
    and_mask = ~mask($1, '0')
  when /mem\[(\d+)\] = (\d+)/
    address, value = $1.to_i, $2.to_u64
    mem[address] = (value & and_mask) | or_mask
  end
end

puts mem.values.sum
