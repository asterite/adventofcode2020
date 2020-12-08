ops = File.read_lines("#{__DIR__}/input.txt").map do |line|
  op, value = line.split
  {op, value.to_i}
end

found = Set(Int32).new
acc = 0
ip = 0

while found.add?(ip)
  op, value = ops[ip]
  case op
  when "acc"
    acc += value
  when "jmp"
    ip += value
    next
  end

  ip += 1
end

puts acc
