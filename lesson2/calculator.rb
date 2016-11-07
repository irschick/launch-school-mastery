require 'yaml'

# message file for calculator
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

# =========

def messages(message)
  MESSAGES[LANGUAGE][message]
end

def prompt(prompt_in)
  Kernel.puts('=> ' + prompt_in)
end

def valid_number?(string_to_check)
  string_to_check.to_i.nonzero?
end

def number?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  input.to_i.to_s == input
end

def integer_regex?(input)
  /^\d+$/.match(input)
end

def integer_converter?(input)
  Integer(input) rescue false
end

def float?(input)
  Float(input) rescue false
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

# ============ Main thread of app ========

prompt(messages('welcome'))
name = ''
loop do
  prompt(messages('valid_name'))
  name = Kernel.gets().chomp()
  if name.empty?
    prompt('....Please type your name')
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
    # puts integer?(number1)
    # puts integerRegEx?(number1)
    # puts integerConverter?(number1)
    puts number?(number1)
    if valid_number?(number1)
      break
    else
      prompt(messages('valid_number_error'))
    end
  end

  number2 = ''
  loop do
    prompt('What\'s the second number')
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    else
      prompt(messages('valid_number_error'))
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
  result =
    case operation
    when '1'
      number1.to_f + number2.to_f
    when '2'
      number1.to_f - number2.to_f
    when '3'
      number1.to_f * number2.to_f
    when '4'
      number1.to_f / number2.to_f
    end
  prompt("#{operation_to_message(operation)} #{number1} and #{number2} ")
  prompt('The result is: ' + result.to_s + '!')
  prompt(messages('continue'))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt(messages('goodbye'))

