# Assignment: Twenty-One

###############################
# shuffle cards
# deal cards
# repeat ask hit or stay until users buts or stays
# if player busts dealer wins
# if player = 21, player wins
# repeat dealer hit or stay until total >=17
# if dealer busts player wins
# compare cards declare winner
###############################
require 'readline'

SUITS = %w(hearts diamonds clubs spades).freeze
VALUES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace).freeze
MAX = 21
STAY_DEALER = 17

def prompt(prompt_in)
  if prompt_in != ''
    Kernel.puts('=> ' + prompt_in)
  end
end

def print_deck(deck)
  p deck
end

def display_hands(user_hand, dealer_hand)
  system 'clear'
  p '-- User Hand ----'
  p user_hand
  p "Value #{total(user_hand)}"

  p '-- Dealer Hand ----'
  p dealer_hand
  p "Value #{total(dealer_hand)}"
end

def total(hand)
  value_cards = []
  hand.each_with_index do |val, _idx|
    value_cards.push(val[1])
  end
  total = 0
  value_cards.each do |card|
    total += card_value(card)
  end
  # correct for Aces
  value_cards.select { |value| value == "ace" }.count.times do
    total -= 10 if total > MAX
  end
  total
end

def hand_a_natural?(hand)
  (hand[0][1] == 'ace' && hand[1][1] == '10') || (hand[1][1] == 'ace' && hand[0][1] == '10')
end

def natural_check(user_hand, dealer_hand)
  if hand_a_natural?(user_hand) && !hand_a_natural?(dealer_hand)
    prompt('natural, user wins')
    winner = :user
  elsif !hand_a_natural?(user_hand) && hand_a_natural?(dealer_hand)
    prompt('natural blackjack, dealer wins')
    winner = :dealer
  elsif hand_a_natural?(user_hand) && hand_a_natural?(dealer_hand)
    prompt('Both have natural blackjack, push')
    winner = :push
  else
    winner = :nowinner
  end
  winner
end

def card_value(card)
  if card == 'ace'
    11
  elsif card.to_i.zero?
    10
  else
    card.to_i
  end
end

def give_hand_to_dealer(hand) # testing feature
  hand << ["diamonds", "ace"]
  hand << ["diamonds", "10"]
end

def give_hand_to_user(hand) # testing feature
  hand << ["diamonds", "ace"]
  hand << ["diamonds", "ace"]
end

def deal_initial_cards(deck, user_hand, dealer_hand)
  2.times do
    draw_card(deck, user_hand)
    draw_card(deck, dealer_hand)
  end
  # testing methods
  # give_hand_to_dealer(dealer_hand)
  # give_hand_to_user(user_hand)
end

def shuffle_cards
  SUITS.product(VALUES).shuffle
end

def draw_card(deck, hand)
  hand << deck.pop
end

def busted?(hand)
  busted = false
  if total(hand) > MAX
    busted = true
  end
  busted
end

def user_move(deck, user_hand, dealer_hand)
  winner = :nowinner
  loop do # player hand
    prompt('Hit or stay') # do you want to continue
    answer = Readline.readline
    break unless answer == 'hit' # someone has max wins
    if answer == 'hit'
      draw_card(deck, user_hand)
      display_hands(user_hand, dealer_hand)
    end
    if busted?(user_hand)
      prompt('User Busted')
      winner = :dealer
      break
    end
  end
  winner
end

def dealer_move(deck, user_hand, dealer_hand)
  winner = :nowinner
  loop do
    dealor_total = total(dealer_hand)
    user_total = total(user_hand)
    if dealor_total < STAY_DEALER
      draw_card(deck, dealer_hand)
      display_hands(user_hand, dealer_hand)
    elsif dealor_total >= STAY_DEALER && dealor_total <= MAX
      puts 'dealer stays'
      if dealor_total > user_total
        puts 'dealer wins'
        winner = :dealer
      elsif dealor_total < user_total
        puts 'user wins'
        winner = :user
      elsif dealor_total == user_total
        winner = :push
        prompt('push')
      end
      break
    end
    if busted?(dealer_hand) # the busted? method is not shown
      winner = :user
      prompt('Dealer Busts. user wins')
      break
    end
  end
  winner
end

# ================== Main ===============

computer_won = 0
user_won = 0
no_one_won = 0
MAX_WINS = 5

loop do
  user_hand = []
  dealer_hand = []
  deck = shuffle_cards
  deal_initial_cards(deck, user_hand, dealer_hand)
  display_hands(user_hand, dealer_hand)

  # check for natural wins
  winner = natural_check(user_hand, dealer_hand)
  if winner == :nowinner
    winner = user_move(deck, user_hand, dealer_hand)
    if winner == :nowinner
      winner = dealer_move(deck, user_hand, dealer_hand)
    end
  end

  # game is over now
  case winner # keep track of winning progress
  when :user
    user_won += 1
  when :dealer
    computer_won += 1
  else
    no_one_won += 1 # board was full
  end
  prompt("Game over, push a key to play again")
  prompt("You won #{user_won} and the computer won #{computer_won}")
  Readline.readline
  # check progress towards max wins
  break unless user_won < MAX_WINS && computer_won < MAX_WINS
end
prompt("You won #{user_won} and the computer won #{computer_won}")
