require 'pry'
class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS  = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Last row
    [0,3,6], # First column
    [1,4,7], # Middle column
    [2,5,8], # Last column
    [0,4,8], # \ Diagonal
    [6,4,2]  # / Diagonal
  # et cetera, creating a nested array for each win combination
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @board[input.to_i-1]
    input.to_i-1
  end

  def move(input, token="X" )
    @board[input.to_i] = token
  end

  def position_taken?(input)
    # @board[input.to_i] != " " ? true : false
    @board[input.to_i] == "X" ||   @board[input.to_i] == "O"
    # !(@board[input.to_i] == " " ||   @board[input.to_i] == "")
  end

  def valid_move?(input)
    input.to_i.between?(0, 8) && !position_taken?(input)
    # binding.pry
  end

  def turn
    until !position_taken?(input)
      puts "Please enter 1-9:"
      input = gets.strip
      if !position_taken?(input)
        input_to_index(input)
        valid_move?(input)
        current_player
        move(input.to_i-1)
        display_board
      end
    end
  end

  def turn_count
    @board.count {|char| char == "X"|| char == "O"}
  end

  def current_player
    turn_count.odd? ? "O" : "X"
    # binding.pry
  end


  def won?
  end

  def full?
    @board.all?{|character| character =="X" || character =="O"}
  end

  def draw?
  end

  def over?
  end

  def winner
  end

  def play
  end


end
