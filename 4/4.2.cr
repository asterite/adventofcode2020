alias Rule = String -> Bool

def four_digits?(text, min, max)
  text.matches?(/\A\d{4}\Z/) && min <= text.to_i <= max
end

RULES = {
  "byr" => Rule.new { |text| four_digits?(text, 1920, 2002) },
  "iyr" => Rule.new { |text| four_digits?(text, 2010, 2020) },
  "eyr" => Rule.new { |text| four_digits?(text, 2020, 2030) },
  "hgt" => Rule.new do |text|
    case text
    when .ends_with?("cm") then 150 <= text[0...-2].to_i <= 193
    when .ends_with?("in") then 59 <= text[0...-2].to_i <= 76
    else                        false
    end
  end,
  "hcl" => Rule.new { |text| text.matches?(/\A#[0-9a-f]{6}\Z/) },
  "ecl" => Rule.new { |text| text.in?("amb", "blu", "brn", "gry", "grn", "hzl", "oth") },
  "pid" => Rule.new { |text| text.matches?(/\A\d{9}\Z/) },
}

p File.read_lines("#{__DIR__}/input.txt")
  .slice_when(&.empty?)
  .map(&.join(" ").strip.split.map(&.split(":")).to_h)
  .count { |passport|
    RULES.all? { |field, rule|
      passport[field]?.try { |value| rule.call(value) }
    }
  }
