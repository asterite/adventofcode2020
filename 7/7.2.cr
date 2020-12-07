rules = File.read_lines("#{__DIR__}/input.txt").to_h do |line|
  left_match = line.match(/(\w+ \w+) bags contain\s+/).not_nil!
  rest = line.lchop(left_match[0])
  {
    left_match[1],
    rest.scan(/(\d+) (\w+ \w+) bag/).map { |m|
      {m[1].to_i, m[2]}
    },
  }
end

def count(target, rules)
  rules[target].sum(0) do |amount, entry|
    amount + amount * count(entry, rules)
  end
end

p count("shiny gold", rules)
