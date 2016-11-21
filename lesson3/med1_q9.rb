munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# loop through munsters | key |
#   if age in range of adult
#     key.add hash age_group = adult
#   else if  age in range of senior
#     key.add hash age_group = senior
#   else if  age in range of kid
#     key.add hash age_group = kid
# end
    

# h = { "a" => 100, "b" => 200 }
# h.each {|key, value| puts "#{key} is #{value}" }
# h.each {|key, value| puts "#{key}" }
# h.each {|key, value| puts "#{value}" }
# h.each_key { |key| puts key }
# h.each_value { |value| puts value }

munsters.each { |name, details|  
  case details["age"]
  when 0...18
    details["age_group"] = 'kid'
  when 18...65
    details["age_group"] = 'adult'
  else
    details["age_group"] = 'senior'
  end
}
p munsters

