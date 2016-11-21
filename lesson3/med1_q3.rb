# Question 3

# The result of the following statement will be an error:

begin
  puts "the value of 40 + 2 is " + (40 + 2)
rescue Exception => e
  puts "Error: " + e.to_s 
end

begin
  puts "the value of 40 + 2 is " + (40 + 2).to_s
  puts "the value of 40 + 2 is #{(40 + 2)}" 
rescue Exception => e
  puts "Error: " + e.to_s 
end
