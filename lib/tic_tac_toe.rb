
class TicTacToe

def initialize
      @board = Array.new(9, " ")
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
 user_input.to_i - 1
end

def move (index, player)
   @board[index] = player
end

def position_taken?(index)
   @board[index] != " "
 end

def valid_move?(index)
  !position_taken?(index) && index.between?(0,8)
end

def turn_count
    @board.count{|square| square != " "}
  end

def current_player
    turn_count.even? ? "X" : "O"
end

def turn
    puts "Where would you like to place your token? [1-9]"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
end
 
def won?
  if @board.all? { |place| place == ' ' }
    return false
  end
  for combo in WIN_COMBINATIONS
    if combo.all? { |index| @board[index] == 'X' }
      return combo
        elsif combo.all? { |index| @board[index] == 'O' }
        return combo
  end
end
  false
end

def full?
    @board.all? {|full| full == "X" || full == "O"} ? true : false
end

def draw?
    if full? == true && won?  == false
      return true
    else
      return false
  end
end

def over?
    if draw? == true || full? == true || won? == true
      return true
    else
      false
  end
end
 
def winner
      if won?
        win_combination = won?
          if @board[win_combination[0]] == "X"
            return "X"
          else
            return "O"
    end
  end
end

# def play
#     turn until over?
#     puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
#   end
end
