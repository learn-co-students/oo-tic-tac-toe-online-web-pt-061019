class TicTacToe
  
  initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5], # Middle row
      [6,7,8], # Bottom row 
      [0,3,6], # First column
      [1,4,7], # Second column
      [2,5,8], # Third column
      [1,4,8], # First diagonal
      [2,4,6]  # Second diagonal
    ]
    
  def input_to_index(user_input)
    case user_input
    when "1"
      board[0]
    when "2"
      board[1]
    when "3"
      board[2]
    when "4"
      board[3]
    when "5"
      board[4]
    when "6"
      board[5]
    when "7" 
      board[6]
    when "8"
      board[7]
    when "9"
      board[8]
    else 
      puts "That number is invalid"
    end 
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  
  
end