require_relative "tic_tac_toe"
require "test/unit"
class TestTicTacToe < Test::Unit::TestCase
  def test_row_wins
    puts 'Test row wins'
    game_session = TicTacToe.new

    # row 1
    display_test = game_session.init_board
    display_test[1] = game_session.computer_mark
    display_test[2] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)

    display_test = game_session.init_board
    display_test[1] = game_session.computer_mark
    display_test[3] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)

    display_test = game_session.init_board
    display_test[2] = game_session.computer_mark
    display_test[3] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)

    # row 2
    display_test = game_session.init_board
    display_test[4] = game_session.computer_mark
    display_test[5] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)

    display_test = game_session.init_board
    display_test[4] = game_session.computer_mark
    display_test[6] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)

    display_test = game_session.init_board
    display_test[5] = game_session.computer_mark
    display_test[6] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)

    # row 3
    display_test = game_session.init_board
    display_test[7] = game_session.computer_mark
    display_test[8] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)

    display_test = game_session.init_board
    display_test[7] = game_session.computer_mark
    display_test[9] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)

    display_test = game_session.init_board
    display_test[8] = game_session.computer_mark
    display_test[9] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)

    # # should not win here
    display_test = game_session.init_board
    display_test[1] = game_session.computer_mark
    display_test[8] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(false, winner == game_session.computer_winner)
  end  

  def test_col_wins
    puts 'Testing columns wins'
    game_session = TicTacToe.new

    # test col 1
    display_test = game_session.init_board
    display_test[1] = game_session.computer_mark
    display_test[4] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)

    display_test4 = game_session.init_board
    display_test4[4] = game_session.computer_mark
    display_test4[7] = game_session.computer_mark
    game_session.computer_choice!(display_test4)
    is_game_over, winner = game_session.game_over?(display_test4)
    assert_equal(true, winner == game_session.computer_winner)

    display_test = game_session.init_board
    display_test[1] = game_session.computer_mark
    display_test[7] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)

    # test col 2
    display_test2 = game_session.init_board
    display_test2[2] = game_session.computer_mark
    display_test2[5] = game_session.computer_mark
    game_session.computer_choice!(display_test2)
    is_game_over, winner = game_session.game_over?(display_test2)
    assert_equal(true, winner == game_session.computer_winner)

    display_test2 = game_session.init_board
    display_test2[5] = game_session.computer_mark
    display_test2[8] = game_session.computer_mark
    game_session.computer_choice!(display_test2)
    is_game_over, winner = game_session.game_over?(display_test2)
    assert_equal(true, winner == game_session.computer_winner)

    display_test2 = game_session.init_board
    display_test2[2] = game_session.computer_mark
    display_test2[8] = game_session.computer_mark
    game_session.computer_choice!(display_test2)
    is_game_over, winner = game_session.game_over?(display_test2)
    assert_equal(true, winner == game_session.computer_winner)

    # test col 3
    display_test3 = game_session.init_board
    display_test3[3] = game_session.computer_mark
    display_test3[6] = game_session.computer_mark
    game_session.computer_choice!(display_test3)
    is_game_over, winner = game_session.game_over?(display_test2)
    assert_equal(true, winner == game_session.computer_winner)

    display_test3 = game_session.init_board
    display_test3[6] = game_session.computer_mark
    display_test3[9] = game_session.computer_mark
    game_session.computer_choice!(display_test3)
    is_game_over, winner = game_session.game_over?(display_test2)
    assert_equal(true, winner == game_session.computer_winner)

    display_test3 = game_session.init_board
    display_test3[3] = game_session.computer_mark
    display_test3[9] = game_session.computer_mark
    game_session.computer_choice!(display_test3)
    is_game_over, winner = game_session.game_over?(display_test2)
    assert_equal(true, winner == game_session.computer_winner)

    # should not win here
    puts 'Testing columns not wins'
    display_test4 = game_session.init_board
    display_test4[1] = game_session.computer_mark
    display_test4[8] = game_session.computer_mark
    game_session.computer_choice!(display_test4)
    is_game_over, winner = game_session.game_over?(display_test4)
    assert_equal(false, winner == game_session.computer_winner)
  end

  def test_diag_wins
    puts 'Testing diag wins'
    game_session = TicTacToe.new

    display_test = game_session.init_board
    display_test[1] = game_session.computer_mark
    display_test[5] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)
  
    display_test = game_session.init_board
    display_test[1] = game_session.computer_mark
    display_test[9] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)

    display_test = game_session.init_board
    display_test[5] = game_session.computer_mark
    display_test[9] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)

    # diag starting from the right top
    display_test = game_session.init_board
    display_test[3] = game_session.computer_mark
    display_test[5] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)
    
    display_test = game_session.init_board
    display_test[3] = game_session.computer_mark
    display_test[7] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)
    
    display_test = game_session.init_board
    display_test[5] = game_session.computer_mark
    display_test[7] = game_session.computer_mark
    game_session.computer_choice!(display_test)
    is_game_over, winner = game_session.game_over?(display_test)
    assert_equal(true, winner == game_session.computer_winner)
  end
  
  def test_board_full
    game_session = TicTacToe.new

    # ensure the board is full
    display_test = game_session.init_board
    (1..9).each { |num| display_test[num] = game_session.computer_mark }
    assert_equal(true, game_session.board_full?(display_test))

    # ensure the board is not full
    display_test = game_session.init_board
    (1..8).each { |num| display_test[num] = game_session.computer_mark }
    assert_equal(false, game_session.board_full?(display_test))
  end
  
end
