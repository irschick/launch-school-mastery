sentence = "Humpty Dumpty sat on a wall."
reverse_sentence = sentence.split(/\W/).reverse!
p reverse_sentence.join(' ') + '.'

words = sentence.split(/\W/)
words.reverse!
p words
backwards_sentence = words.join(' ') + '.'
p backwards_sentence
