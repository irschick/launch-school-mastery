require 'securerandom'
p SecureRandom.hex(4) + '-' + SecureRandom.hex(2) + '-' + SecureRandom.hex(2) + '-' + SecureRandom.hex(2) + '-' + SecureRandom.hex(6)


CHARACTERS = []
(0..9).each { | num | CHARACTERS << num.to_s}
('a'..'f').each { | char | CHARACTERS << char}

def hex_section(num_characters)
  return_value = ''
  num_characters.times do 
    return_value += CHARACTERS[rand(0..15)]
  end
  return_value
end
p hex_section(8) + '-' + hex_section(4) + '-' + hex_section(4) + '-' + hex_section(4) + '-' + hex_section(12)
