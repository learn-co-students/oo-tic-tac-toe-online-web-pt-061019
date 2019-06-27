class TicTacToe
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end
  
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8)
      true
    else
      false
    end
  end
  
  def turn_count
    @board.count{|index| index == "X" || index == "O"}
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "Please choose a position between 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
      end
    end
  end

  def won?
    WIN_COMBINATIONS.each do |w_combo|
      WIN_COMBINATIONS[0] = w_combo1
      WIN_COMBINATIONS[1] = w_combo2
      WIN_COMBINATIONS[2] = w_combo3
      WIN_COMBINATIONS[3] = w_combo4
      WIN_COMBINATIONS[4] = w_combo5
      WIN_COMBINATIONS[5] = w_combo6
      WIN_COMBINATIONS[6] = w_combo7
      WIN_COMBINATIONS[7] = w_combo8
      
      if turn == w_combo1 || turn == w_combo2 || turn == w_combo3 || turn == w_combo4 || turn == w_combo5 || turn == w_combo6 || turn == w_combo7 || turn == w_combo8
        w_combo
      else
        turn
      end
    end
  end
end