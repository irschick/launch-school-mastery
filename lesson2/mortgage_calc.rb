# pseudo code
# ----------------

# START
#   SET LANGUAGE = 'ENG'
#   GET labels from label file for LANGUAGE
#   PRINT message('welcome')
#
#   While getting valid name
#     PRINT '--> Enter name'
#     GET namefrom user
#   PRINT message('welcome-user' + name)
#
#   While getting valid amount
#     PRINT '--> Enter loan amount'
#     GET loan amount from user
#   While getting valid annual rate
#     PRINT '--> Enter annual int rate'
#     GET annual interest rate
#   SET monthly interest rate = annual interest rate/12
#   While getting valid years
#     PRINT '--> Enter duration years'
#     GET loan duration in years
#   SET loan duration in months = loan duration in years / 12

#   SET p = loan amount
#   SET j = monthly interest rate
#   SET n = loan duration in months

#   SET m = p * (j / (1 - (1 + j)**-n))
#   PRINT m
# END

require 'yaml'

# label file for mort calculator
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')
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
  number_input = 0.0
  loop do
    prompt('What\'s your loan amount')
    number_input = Kernel.gets().chomp()
    if valid_number?(number_input)
      break
    else
      prompt(messages('valid_number_error'))
    end
  end
  loan_amount = number_input.to_f

  number_input = 0.0
  loop do
    prompt('What\'s your loan APR i.e 3.20')
    number_input = Kernel.gets().chomp()
    if valid_number?(number_input) && number_input.to_f() > 0
      break
    else
      prompt(messages('valid_number_error'))
    end
  end
  monthly_interest_rate = ((number_input.to_f / 100) / 12)

  number_input = 0.0
  loop do
    prompt('How long in years?')
    number_input = Kernel.gets().chomp()
    if integer?(number_input)
      break
    else
      prompt(messages('valid_number_error'))
    end
  end
  loan_duration_months = number_input.to_i * 12

  # calcuate the payment
  p = loan_amount
  j = monthly_interest_rate
  n = loan_duration_months
  monthly_payment = p * (j / (1 - (1 + j)**-n))
  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")

  prompt(messages('continue'))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt(messages('goodbye'))
