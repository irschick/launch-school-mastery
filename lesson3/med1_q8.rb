# words = "the flintstones rock"
# words = "The Flintstones Rock"

words = "the flintstones rock"
words_array = words.split(' ')
words_array_capitalize = words_array.map { |value|  value.capitalize }
words_new = words_array_capitalize.join(' ')
p words_new

# words = "The Flintstones Rock"
words = "the flintstones rock"
p words.split(' ').map { |value|  value.capitalize }.join(' ')

