# Question 2
# Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"
# ex:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

# create holding hash
# loop through string
#   for each character found
#     is in holding hash?
#     if yes
#       increment value by 1
#     else  
#       add to hash
#     end
#   end
# end 

holding_hash = {}
statement.each_char do | c |
  # print c
  key = c.to_s.upcase 
  if key != ' '
    if holding_hash.key?(key)
      puts 'found key in result hash: ' + key
      holding_hash[key] = holding_hash[key] + 1
    else 
      puts 'did not find key, so adding key:' + key
      holding_hash[key] = 1
    end
  end
end
p holding_hash

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
p letters
p result

