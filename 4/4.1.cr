REQUIRED_FIELDS = %w(byr iyr eyr hgt hcl ecl pid)

p File.read_lines("#{__DIR__}/input.txt")
  .slice_when(&.empty?)
  .map(&.join(" ").strip.split.map(&.split(":").first))
  .count { |fields|
    REQUIRED_FIELDS.all? { |required_field|
      fields.includes?(required_field)
    }
  }
