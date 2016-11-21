ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# Add up all of the ages from our current Munster family hash:

total = 0
ages.each_value { |value| total = total + value.to_f }
p total

p ages.values.inject(:+)