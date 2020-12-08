ops = File.read_lines("#{__DIR__}/input.txt").map do |line|
  op, value = line.split
  {op, value.to_i}
end

def run(ops)
  found = Set(Int32).new
  acc = 0
  ip = 0

  while found.add?(ip) && ip < ops.size
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

  {ip >= ops.size, acc}
end

ops.each_with_index do |(op, value), i|
  next unless op.in?("nop", "jmp")

  new_ops = ops.dup
  new_ops[i] = {op == "nop" ? "jmp" : "nop", value}
  success, acc = run(new_ops)
  next unless success

  p acc
  break
end
