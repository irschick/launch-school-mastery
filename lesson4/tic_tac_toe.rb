# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

class TicTacToe 
  require 'yaml'
  MESSAGES = YAML.load_file('tic_tack_toe.yaml')
  LANGUAGE = 'en'.freeze
  USER_MARK = 'X'.freeze
  COMPUTER_MARK = 'O'.freeze
  NO_WINNER = 'NO_WINNER'.freeze
  COMPUTER_WINNER = 'COMPUTER_WINNER'.freeze
  USER_WINNER = 'USER_WINNER'.freeze
  MAX_WINS = 5.freeze
  EMPTY_SQUARE = ' '.freeze

  def computer_winner
    COMPUTER_WINNER
  end

  def computer_mark
    COMPUTER_MARK
  end

  def prompt(prompt_in)
    if prompt_in != ''
      Kernel.puts('=> ' + prompt_in)
    end
  end

  def messages(message)
    MESSAGES[LANGUAGE][message]
  end

  # display the board
  def display_board(board_to_display, msg = "")
    system 'clear'
    puts "sq#1       |sq#2      |sq#3 "
    puts "           |          |"
    puts "   #{board_to_display[1]}       |   #{board_to_display[2]}      |    #{board_to_display[3]}  "
    puts "           |          |"
    puts "-----------------------------------"
    puts "sq#4       |sq#5      |sq#6 "
    puts "           |          |"
    puts "  #{board_to_display[4]}        |   #{board_to_display[5]}      |    #{board_to_display[6]}  "
    puts "           |          |"
    puts "-----------------------------------"
    puts "sq#7       |sq#8      |sq#9 "
    puts "           |          |"
    puts "  #{board_to_display[7]}        |   #{board_to_display[8]}      |    #{board_to_display[9]}  "
    puts "           |          |"
    prompt(msg)
  end

  def joinor(arr, delimiter=', ', word='or')
    case arr.size
    when 0 then ''
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end
  end

  # is this a squqre 1..9
  def valid_square?(square_in)
    %w(1 2 3 4 5 6 7 8 9).include?(square_in.to_s)
  end

  def row_winner_square(display_in, who_to_check)
    square_to_win = 0
    (0..2).each do |row|
      row_offset = row*3
      if display_in[row_offset + 1] == who_to_check && display_in[row_offset + 2] == who_to_check && display_in[row_offset + 3] == EMPTY_SQUARE
        square_to_win = row_offset + 3
        break
      elsif display_in[row_offset + 1] == who_to_check && display_in[row_offset + 2] == EMPTY_SQUARE && display_in[row_offset + 3] == who_to_check 
        square_to_win = row_offset + 2
        break
      elsif display_in[row_offset + 1] == EMPTY_SQUARE && display_in[row_offset + 2] == who_to_check && display_in[row_offset + 3] == who_to_check
        square_to_win = row_offset + 1
        break
      end      
    end
    square_to_win 
  end

  def col_winner_square(display_in, who_to_check)
    square_to_win = 0
    (0..2).each do |col|
      col_offset = col
      if display_in[col_offset + 1] == who_to_check && display_in[col_offset + 4] == who_to_check && display_in[col_offset + 7] == EMPTY_SQUARE
        square_to_win = col_offset + 7
        break
      elsif display_in[col_offset + 1] == who_to_check && display_in[col_offset + 4] == EMPTY_SQUARE && display_in[col_offset + 7] == who_to_check 
        square_to_win = col_offset + 4
        break
      elsif display_in[col_offset + 1] == EMPTY_SQUARE && display_in[col_offset + 4] == who_to_check  && display_in[col_offset + 7] == who_to_check
        square_to_win = col_offset + 1
        break
      end      
    end
    square_to_win 
  end

  def diag_winner_square(display_in, who_to_check)
    square_to_win = 0

    puts display_in[1] == who_to_check
    puts display_in[5] == EMPTY_SQUARE
    puts display_in[9] == who_to_check

    if display_in[1] == who_to_check && display_in[5] == EMPTY_SQUARE && display_in[9] == who_to_check
      puts 'Square 5 available'
      square_to_win = 5
    end
    if (display_in[1] == who_to_check && display_in[5] == who_to_check && display_in[9] == EMPTY_SQUARE)
      square_to_win = 9
    elsif (display_in[1] == who_to_check && display_in[5] == EMPTY_SQUARE && display_in[9] == who_to_check)
      square_to_win = 5
    elsif (display_in[1] == EMPTY_SQUARE && display_in[5] == who_to_check && display_in[9] == who_to_check)
      square_to_win = 1
    elsif (display_in[3] == who_to_check && display_in[5] == who_to_check && display_in[7] == EMPTY_SQUARE)
      square_to_win = 7
    elsif (display_in[3] == who_to_check && display_in[5] == EMPTY_SQUARE && display_in[7] == who_to_check)
      square_to_win = 5
    elsif (display_in[3] == EMPTY_SQUARE && display_in[5] == who_to_check && display_in[7] == who_to_check)
      square_to_win = 3
    end
    square_to_win 
  end

  # is square occupied
  def square_full?(square_in, display_in)
    display_in[square_in.to_i] == USER_MARK || display_in[square_in.to_i] == COMPUTER_MARK
  end

  # did someone win?
  def check_winner(display_in, who_to_check)
    # check rows first
    (display_in[1] == who_to_check &&
     display_in[2] == who_to_check &&
     display_in[3] == who_to_check) ||

    (display_in[4] == who_to_check &&
     display_in[5] == who_to_check &&
     display_in[6] == who_to_check) ||

    (display_in[7] == who_to_check &&
     display_in[8] == who_to_check &&
     display_in[9] == who_to_check) ||

  # check diag
    (display_in[1] == who_to_check &&
     display_in[5] == who_to_check &&
     display_in[9] == who_to_check) ||

    (display_in[7] == who_to_check &&
     display_in[5] == who_to_check &&
     display_in[3] == who_to_check) ||

  # check sides
    (display_in[1] == who_to_check &&
     display_in[4] == who_to_check &&
     display_in[7] == who_to_check) ||

    (display_in[2] == who_to_check &&
     display_in[5] == who_to_check &&
     display_in[8] == who_to_check) ||

    (display_in[3] == who_to_check &&
     display_in[6] == who_to_check &&
     display_in[9] == who_to_check)
  end

  # check who won
  def winner?(display_in)
    winner = NO_WINNER
    if check_winner(display_in, COMPUTER_MARK)
      winner = COMPUTER_WINNER
    elsif check_winner(display_in, USER_MARK)
      winner = USER_WINNER
    end
    winner
  end

  # all free squares that are not occupied
  def all_free_squares(display_in)
    display_in.select { |_k, v| v != COMPUTER_MARK && v != USER_MARK }
  end

  def free_square(display_in)
    free_squares = all_free_squares(display_in)
    free_squares_array = free_squares.to_a
    free_squares_array.sample[0].to_i
  end

  def board_full?(display_in)
    !display_in.value?(' ')
  end

  def init_board
    new_board = {}
    (1..9).each { |num| new_board[num] = EMPTY_SQUARE }
    new_board
  end

  def board_test(display_in, setup_type)
    display_in[1] = COMPUTER_MARK
    display_in[4] = COMPUTER_MARK
    display_in
  end

  def user_choice!(display_in)
    loop do # ask until user picks a non empty square
      free_values = all_free_squares(display_in).keys.to_a
      prompt("Pick from the following Free Squares: " + joinor(free_values).to_s)
      require 'readline'
      square = Readline.readline
      if !valid_square?(square)
        display_board(display_in, "Please pick a valid square i.e 1")
        # prompt('Please pick a valid square i.e 1')
      elsif square_full?(square, display_in)
        display_board(display_in, 'Please pick again.... square not empty')
      else
        add_piece_to_boaard(display_in, USER_MARK, square.to_i)
        break
      end
    end # get valid input
  end

  # add a piece to the board
  def add_piece_to_boaard(display_in, player_mark, position)
    display_in[position] = player_mark
    display_board(display_in)
  end

  def can_computer_win?(display_in)
    puts "computer can win???"
    winner_square = 0
    if winner_square == 0
      puts "computer can't win yet... look at rows"
      winner_square = row_winner_square(display_in, COMPUTER_MARK) 
    end
    if winner_square == 0
      puts "computer can't win yet look at cols"
      winner_square = col_winner_square(display_in, COMPUTER_MARK) 
    end
    if winner_square == 0
      puts "computer can't win yet... so check diagonals"
      winner_square = diag_winner_square(display_in, COMPUTER_MARK) 
    end
    winner_square
  end

  # computer chooses a free squre
  def computer_choice!(display_in)
    winner_square = can_computer_win?(display_in)
    puts winner_square
    if winner_square != 0 
      add_piece_to_boaard(display_in, COMPUTER_MARK, winner_square)
    else
      free_square_value = free_square(display_in)
      if free_square_value.nonzero? # not empty board
        add_piece_to_boaard(display_in, COMPUTER_MARK, free_square_value)
      end
    end
  end

  # get the user name
  def display_name
    require 'readline'
    name = ''
    loop do
      prompt(messages('welcome'))
      name = Readline.readline
      if name.empty?
        prompt('....Please type your name')
      else
        break
      end
    end
    prompt("Hello #{name}")
  end

  def game_over?(display_in)
    board_full = board_full?(display_in)
    winner_check = winner?(display_in)
    game_over = false
    if winner_check == USER_WINNER
      prompt("**** You won!!")
      game_over = true
    elsif winner_check == COMPUTER_WINNER
      prompt("***** Computer won!!")
      game_over = true
    elsif board_full == true
      prompt("board is full")
      game_over = true
    end
    return game_over, winner_check
  end

  # File:  tc_tic_tac_toe.rb

  def play
    # ========== main loop
    computer_won = 0
    user_won = 0
    no_one_won = 0
    display_name # get user name

    loop do # loop until user does not want to play a new game anymore
      display = init_board # display keeps track of board state
      display_board(display)
      is_game_over = false
      winner = NO_WINNER

      loop do # while no winner or not board full
        user_choice!(display)
        is_game_over, winner = game_over?(display)
        break unless is_game_over == false
        computer_choice!(display)
        is_game_over, winner = game_over?(display)
        break unless is_game_over == false
      end # while no winner or board full

      puts 'Lets see who won'
      case winner # keep track of winning progress
        when USER_WINNER
          user_won += 1
        when COMPUTER_WINNER
          computer_won += 1
        else
          no_one_won += 1
      end  
      # break unless user_won == MAX_WINS || COMPUTER_WINNER == MAX_WINS
      if user_won == MAX_WINS || COMPUTER_WINNER == MAX_WINS
        puts "max wins"
        break
      end
      # winner or board full
      prompt("You won #{user_won} and the computer won #{computer_won}")
      prompt(messages('continue')) # do you want to continue
      answer = Kernel.gets.chomp
      break unless answer.downcase.start_with?('y')
    end
    prompt(messages('goodbye'))
  end
end

