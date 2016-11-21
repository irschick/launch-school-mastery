# array#map!
# Using array#map!, shorten each of these names to just 3 characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |n| n[0..2]  }
p flintstones

numbers = %w(10 10 10)
numbers.map! { |n| n[0..0]  }
p numbers

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! do |name|
  name[0, 3]
end
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |n| n[0,3]  }
p flintstones
