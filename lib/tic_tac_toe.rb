require'pry'
class TicTacToe

def initialize(board = nil)
      @board = board || Array.new(9, " ")
end

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

def move (index, player = "X")
   @board[index] = player
end

def position_taken?(index)
   @board[index] != " "
 end

def valid_move?(index)
  !position_taken?(index) && index.between?(0,8)
end

def turn_count
    @board.count{|square| square == "X" || square == "O" }
  end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
end

def turn
    puts "Where would you like to place your token? [1-9]"
    user_input = gets.strip
    index = input_to_index(user_input)
   if valid_move?(index)
      move(index, current_player)
       display_board
    else
      turn
    end
end
 
def won?
    WIN_COMBINATIONS.detect {|win_combo| win_combo.all?{|pos| @board[pos]=="X"} || win_combo.all?{|pos| @board[pos]=="O"}}
end

def full?
    @board.all? {|full| full == "X" || full == "O"} 
end

def draw?
   !won? && full? ? true : false
end

def over?
   draw? || full? || won? ? true : false 
  
end

def winner
    WIN_COMBINATIONS.find do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
          return "X"
      elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
          return "O"
      else
          nil
      end
    end
  end

 def play
    until over?
      turn
    end
    if won?
      winner == "X" || winner == "O"
       puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!" 
     end
  end
end
