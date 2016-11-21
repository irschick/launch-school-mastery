ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if "Spot" is present.

search_value = 32
search_key = 'Herman'

p ages.select { |k,v| (v == search_value) }
puts ages.has_value?(search_value)

puts ages.key?(search_key)
puts ages.include?(search_key)
puts ages.member?(search_key)


# search_value = 'Spot'
# p ages.select { |k,v| (v == search_value) }
# puts ages.has_value?(search_value)
# puts ages.key?(search_value)
# puts ages.include?(search_value)
# puts ages.member?(search_value)

