VALID_CHOICES = ['rock', 'paper', 'scissors']

def display_results(user_choice, computer_choice)
  if  (user_choice == 'rock' && computer_choice == 'scissors') ||
      (user_choice == 'paper' && computer_choice == 'rock') ||
      (user_choice == 'scissors' && computer_choice == 'paper')
    prompt("You won")
  elsif (user_choice == 'rock' && computer_choice == 'paper') ||
        (user_choice == 'paper' && computer_choice == 'scissors') ||
        (user_choice == 'scissors' && computer_choice == 'rock')
    prompt("You lost")
  else
    prompt("You tied")
  end
end

def prompt(prompt_in)
  Kernel.puts('=> ' + prompt_in)
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end
  computer_choice = VALID_CHOICES.sample()
  prompt("You chose: #{choice}; computer_choice: #{computer_choice}")
  display_results(choice, computer_choice)
  prompt("Play again (Y to continue)?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt("Thanks for playing!")
