
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |n| n[0,3]  }
p flintstones