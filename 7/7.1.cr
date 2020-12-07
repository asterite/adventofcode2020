rules = File.read_lines("#{__DIR__}/input.txt").to_h do |line|
  left_match = line.match(/(\w+ \w+) bags contain\s+/).not_nil!
  rest = line.lchop(left_match[0])
  {left_match[1], rest.scan(/(\d+) (\w+ \w+) bag/).map(&.[2])}
end

def rule_has?(container, target, rules)
  rules[container].any? do |entry|
    entry == target || rule_has?(entry, target, rules)
  end
end

p rules.each_key.count { |key| rule_has?(key, "shiny gold", rules) }
