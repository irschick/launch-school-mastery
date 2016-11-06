def prompt(prompt_in)
  Kernel.puts('=> ' + prompt_in)
end

def valid_number?(string_to_check)
  string_to_check.to_i != 0
end

def operation_to_message(operation_in)
  case operation_in 
        when '1' 
          'Adding'
        when '2' 
          'Subtracting'
        when '3' 
          'Multiplying'
        when '4' 
          'Dividing'
  end
end

prompt('Welcome to calculator')
name = ''
loop do
  prompt('What\'s you name?')
  name = Kernel.gets().chomp()
  if name.empty?
    prompt('Please type your name')
  else
    break
  end
end
prompt("Welcome #{name}")

loop do
  number1 = ''
  loop do
    prompt('What\'s the first number')
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break()
    else
      prompt('Hmmmm... Please type in a number')
    end
  end

  number2 = ''
  loop do
    prompt('What\'s the second number')
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break()
    else
      prompt('Hmmmm... Please type in a number')
    end
  end

  operation = ''
  operator_prompt = <<-MSG
  What operation do you want 
    1) add 
    2) subtract 
    3) multiple 
    4) divide
  MSG

  loop do
    prompt(operator_prompt)
    operation = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt(operator_prompt)
    end
  end
  
  result = case operation 
        when '1' 
          number1.to_i + number2.to_i
        when '2' 
          number1.to_i - number2.to_i
        when '3' 
          number1.to_i * number2.to_i
        when '4' 
          number1.to_f / number2.to_f
  end
  prompt("#{operation_to_message(operation)} #{number1} and #{number2} ")
  prompt('The result is: ' + result.to_s + '!')
  prompt('Do you want to perfomr another calculation? Y to continue')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt('Goodbye!')

