require 'pry'
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    i = "#{input}".to_i
    i -= 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end

  def valid_move?(input)
    input.between?(0, 8) && position_taken?(input)==false
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    input = gets
    input = input_to_index(input)
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |w_combo|
      w_combo1 = @board[w_combo[0]]
      w_combo2 = @board[w_combo[1]]
      w_combo3 = @board[w_combo[2]]
      (w_combo1 == "X" && w_combo2 == "X" && w_combo3 == "X") || (w_combo1 == "O" && w_combo2 == "O" && w_combo3 == "O")
    end
  end

  def full?
    @board.include?(" ") ? false : true
  end

  def draw?
    if (full? == true) && (won? == nil)
      true
    else (full? == false) || (won? == true)
      false
    end
  end

  def over?
    won? || draw?
  end

  def winner
    if x = won?
      @board[x[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
        puts "Congratulations #{current_player}!"
    else draw?
      puts "Cat's a Game!"
    end
  end
end
