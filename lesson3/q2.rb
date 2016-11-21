# != means "not equals"
# ? : is the ternary operator for if...else
# !!<some object> is used to turn any object into their boolean equivalent. (Try it in irb)
# !<some object> is used to turn any object into the opposite of their boolean equivalent, just like the above, but opposite.


joe_happy = false
mike_happy = true

puts "is joe's happiness = mike's happiness"
puts joe_happy == mike_happy

puts "is joe's happiness not equal mike's happiness"
puts joe_happy != mike_happy

puts "what is the opposite of joes happiness"
puts !joe_happy 

# joe_happy == mike_happy ? puts 'both are happy' : puts 'one is happy, one is not'

# Example-1
puts "Both happy?"
both_happy = ( joe_happy == mike_happy ? true : false);  
puts both_happy

puts "!!"
name = 'mike'
puts !!name

puts "!!"
value = 0
puts !!value

puts "!!"
value = 1
puts !!value