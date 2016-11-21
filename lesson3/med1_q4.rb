# args = [ "-m", "-q", "filename" ]
# args.shift     #=> "-m"
# args           #=> ["-q", "filename"]

args = [ "-m", "-q", "filename" ]
args.shift(0)  #=> ["-m", "-q"]
p args           #=> ["filename"]

args = [ "-m", "-q", "filename" ]
args.shift(1)  #=> ["-m", "-q"]
p args           #=> ["filename"]

args = [ "-m", "-q", "filename" ]
args.shift(2)  #=> ["-m", "-q"]
p args           #=> ["filename"]

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  x = numbers.pop(1)
  p numbers
  p x
end

a = [ "a", "b", "c", "d" ]
p a
a.pop     #=> "d"
p a         
a.pop(2)  #=> ["b", "c"]
p a         #=> ["a"]

a = [ "a", "b", "c", "d" ]
p a
a.pop(3)     
p a         
