require 'pry'

class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board
    @board
  end

  def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    return user_input.to_i - 1
  end

  def move(index, players_token = "X")
    @board[index] = "#{players_token}"
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end

  def valid_move?(index)
    index >= 0 && index < 8 && !position_taken?(index) ? true : false
  end

  def turn
    puts "Please enter 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)
    player = current_player
    if valid_move?(index)
      # current_player
      move(index, player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      board[win_combo[0]] == board[win_combo[1]] &&
        board[win_combo[1]] == board[win_combo[2]]

      board[win_combo[0]] == "X" && board[win_combo[1]] == "X" &&
      board[win_combo[2]] == "X" ||

      board[win_combo[0]] == "O" && board[win_combo[1]] == "O" &&
      board[win_combo[2]] == "O"
    end
  end
      # my long_method:
      # if win = false
      # win_index1 = win_combo[0]
      # win_index2 = win_combo[1]
      # win_index3 = win_combo[2]
      #
      # position1 = board[win_index1]
      # position2 = board[win_index2]
      # position3 = board[win_index3]
      # position1 == position2 && position2 == position3
      # binding.pry
      # .any?
      # .all? {|x| x == array[0]}

  def full?
    board.all? {|space| space == "X" || space == "O"}
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    draw? || won? || full? ? true : false
  end

  def winner
    # win_combo = won?
    # binding.pry
    if won?
      # binding.pry
      board[won?[0]]
    end
  end

    # else
    #   return win_combo
    # binding.pry
    # elsif !winner = nil
    # winner = board[won?[0]]
    # elsif !won?
    # return nil

  def play
    until over?
      turn
      # binding.pry
    end
    # if over?
      if won?
      winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
      # end
    end
  end

end
