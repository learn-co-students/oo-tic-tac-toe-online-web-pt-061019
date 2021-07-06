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
    [2,4,6]
    ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
 
  def input_to_index(input)
    input.to_i - 1
  end
 
  def move(index, token)
     @board[index] = token
  end
  
  def position_taken?(index)
   !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
   
    index.to_i.between?(0, 8) && !position_taken?(index)
  end
  
  def turn
   puts "Please enter 1-9:"
      input = gets.chomp
      index = input_to_index(input)
      #binding.pry
      if valid_move?(index) 
        move(index, current_player) 
        display_board
      else 
        turn
      end
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def won? 
    WIN_COMBINATIONS.detect do |winner|
      @board[winner[0]] == @board[winner[1]] &&
      @board[winner[1]] == @board[winner[2]] &&
     (@board[winner[0]] == "X" || @board[winner[0]] == "O")
    end
  end
  
  def full? 
    @board.all?{|token|token == "X" || token == "O"}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    if draw?
      true 
    elsif won?
      true
    else
      false
    end
  end
  
  def winner
    if win = won?
      @winning_player = @board[win.first]
    end
  end 
  
  def play 
   until over?
    turn 
   end
   
   if won? 
     puts "Congratulations #{winner}!" if won?
   else 
     puts "Cat's Game!"
     
   end
   
 end
  
  
end 