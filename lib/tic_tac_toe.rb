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
  
  def input_to_index(input)
    input.to_i - 1
  end 
  
  def move(index, token = "X")
    @board[index] = token 
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end
  
  def valid_move 
    
  end
  
  def turn
    input = gets
    input = input_to_index(input)
    if valid_move?(input)
      move(input)
      display_board
    else
      input = gets
    end
    current_player
  end
    
  end
  
  def turn_count
  
  end
 
  def current_player
  
  end
  
  def won?
  
  end
  
  def full?
  
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