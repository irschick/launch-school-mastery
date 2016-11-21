def color_valid_old(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
# Can be significantly simplified by changing it to just:

def color_valid(color)
  color == "blue" || color == "green"
end

p color_valid_old('black')
p color_valid('black')

p color_valid_old('blue')
p color_valid('blue')