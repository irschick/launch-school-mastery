VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_CHOICES_SHORT = %w(r p sc l sp)

def win_short?(first, second) 
  (first == 'sc' && second == 'p') ||
  (first == 'p' && second == 'r') ||
  (first == 'r' && second == 'l') ||
  (first == 'l' && second == 'sp') ||
  (first == 'sp' && second ==  'sc') ||
  (first == 'sc' && second == 'l') ||
  (first == 'l' && second == 'p') ||
  (first == 'p' && second == 'sp') ||
  (first == 'sp' && second == 'r') ||
  (first == 'r' && second == 'sc') 
end

def translate(short_choice)
  result =
    case short_choice
    when 'sc'
      'scissors'
    when 'sp'
      'spock'
    when 'p'
      'paper'
    when 'r'
      'rock'
    when 'l'
      'lizard'
    end
end

def display_results_short(user_choice, computer_choice)
  if win_short?(user_choice, computer_choice)
    prompt("You won")
    true
  elsif win_short?(computer_choice, user_choice)
    prompt("You lost")
    false
  else
    prompt("You tied")
    false
  end
end

def prompt(prompt_in)
  Kernel.puts('=> ' + prompt_in)
end

user_wins = 0
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES_SHORT.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end
  computer_choice = VALID_CHOICES_SHORT.sample()
  prompt("You chose: #{translate(choice)}; computer_choice: #{translate(computer_choice)}")
  if display_results_short(choice, computer_choice)
    user_wins = user_wins + 1
  end

  prompt("User wins: #{user_wins}")
  prompt("Play again (Y to continue)?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt("Thanks for playing!")
