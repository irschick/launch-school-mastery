def tricky_method(a_string_param, an_array_param)
  p a_string_param.object_id
  a_string_param += "rutabaga"
  p a_string_param.object_id

  p an_array_param.object_id
  an_array_param << "rutabaga"
  p an_array_param.object_id
end


def tricky_method_two(a_string_param, an_array_param)
  p '------'
  p a_string_param.object_id
  a_string_param << 'rutabaga'
  p a_string_param.object_id

  p '------'
  p an_array_param.object_id
  an_array_param = ['pumpkins', 'rutabaga']
  p an_array_param.object_id
end

my_string = "pumpkins"
p 'my_string.object_id'
p my_string.object_id

my_array = ["pumpkins"]
p 'my_array.object_id'
p my_array.object_id

 # tricky_method(my_string, my_array)
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"