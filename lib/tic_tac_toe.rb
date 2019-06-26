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
      puts "Please enter 1-9:"
      input = gets.strip
      if  !position_taken?(input) && input.to_i.to_s == input
        input_to_index(input)
        valid_move?(input)
        # current_player
        move(input.to_i-1,current_player)
        display_board
      else
        turn
      end
  end

  def turn_count
    @board.count {|char| char == "X"|| char == "O"}
  end

  def current_player
    turn_count.odd? ? "O" : "X"
    # turn_count % 2 == 0 ? "X" : "O"
  end


 #find the first winner by compare 1st,2nd,3rd cells are matched
  def won?
    WIN_COMBINATIONS.detect do |winner|
      @board[winner[0]] == @board[winner[1]] &&
      @board[winner[1]] == @board[winner[2]] &&
      (@board[winner[0]] == "X" || @board[winner[0]] == "O")
# binding.pry
      # [1,4,7]
      # ["X","X","X"]
    end
  end

  def draw?
    full? && !won?
  end

  def full?
    @board.all?{|character| character =="X" || character =="O"}
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      @winter = @board[winning_combo.first]
    end
  end

  def play
    # until the game is over
    #   take turns
    # end
    #
    # if the game was won
    #   congratulate the winner
    # else if the game was a draw
    #   tell the players it ended in a draw
    # end
    # puts "Welcome to Tic Tac Toe!"
   until over?
     turn
   end
     if won?
       puts "Congratulations #{winner}!" if won?
       # binding.pry
     else
       puts "Cat's Game!"
     end
   end
end
