string = "this is a string"

p string.slice!(2)        #=> "i"
p string.slice!(3..6)     #=> " is "
p string.slice!(/s.*t/)   #=> "sa st"
p string.slice!("r")      #=> "r"
p string                  #=> "thing"
p '------'

# Shorten this sentence:
# ...remove everything starting from "house".
# Review the String#slice! documentation, and use that method to make the return value 
# "Few things in life are as important as ". 
# But leave the advice variable as "house training your pet dinosaur.".
# As a bonus, what happens if you use the String#slice method instead?

p '------'
advice = "Few things in life are as important as house training your pet dinosaur."
new_advice = advice.slice!('house ')
p advice
p new_advice

p '------'
advice = "Few things in life are as important as house training your pet dinosaur."
p "advice.index('house')"
p advice.index('house')
advice.slice!(0, advice.index('house'))
p advice

p '------'
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, 20)
p advice

p '------'
advice = "Few things in life are as important as house training your pet dinosaur."
new_advice = advice.slice(0, advice.index('house'))
p advice
p new_advice

p '------'
advice = "Few things in life are as important as house training your pet dinosaur."
new_advice = advice.slice(0)
p advice
p new_advice


# p " now's  the time".split        #=> ["now's", "the", "time"]
# p " now's  the time".split(' ')   #=> ["now's", "the", "time"]
# p " now's  the time".split(/ /)   #=> ["", "now's", "", "the", "time"]
# p "1, 2.34,56, 7".split(%r{,\s*}) #=> ["1", "2.34", "56", "7"]
# p "hello".split(//)               #=> ["h", "e", "l", "l", "o"]
# p "hello".split(//, 3)            #=> ["h", "e", "llo"]
# p "hi mom".split(%r{\s*})         #=> ["h", "i", "m", "o", "m"]

# p "mellow yellow".split("ello")   #=> ["m", "w y", "w"]
# p "1,2,,3,4,,".split(',')         #=> ["1", "2", "", "3", "4"]
# p "1,2,,3,4,,".split(',', 4)      #=> ["1", "2", "", "3,4,,"]
# p "1,2,,3,4,,".split(',', -4)     #=> ["1", "2", "", "3", "4", "", ""]
# p "".split(',', -1)               #=> []

# # ------
# p "yo go lo".split("o")   
# p "yo go lo".split("g")  
# p "yo go lo".split(" ")  
# p "yo|go|lo".split("|")  
