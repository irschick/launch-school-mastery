# Alyssa noticed that this will fail if the input is 0, or a negative number, 
# and asked Alan to change the loop. How can you change the loop construct 
# (instead of using begin/end/until) to make this work? Note that 
#   we're not looking to find the factors for 0 or negative numbers, 
#   but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

def factors(number)
  divisors = []
  if number > 0 
    dividend = number
    begin
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
    end until dividend == 0
    divisors
  end
  divisors
end
p factors(10)
p factors(-1)

# def factors_old(number)
#   dividend = number
#   divisors = []
#   begin
#     divisors << number / dividend if number % dividend == 0
#     dividend -= 1
#   end until dividend == 0
#   divisors
# end
# p factors_old(10)
# p factors_old(-1)

def factors_new(number)
  divisors = []
    dividend = number
    while dividend > 0 
    begin
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
    end 
    divisors
  end
  divisors
end
p factors_new(10)
p factors_new(-1)