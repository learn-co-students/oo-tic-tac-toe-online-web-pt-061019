class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5], # Middle row
      [6,7,8], # Bottom row 
      [0,3,6], # First column
      [1,4,7], # Second column
      [2,5,8], # Third column
      [0,4,8], # First diagonal
      [2,4,6]  # Second diagonal
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
    
  def input_to_index(user_input)
    user_input = user_input.to_i
    case user_input
    when 1
      0
    when 2
      1
    when 3
      2
    when 4
      3
    when 5
      4
    when 6
      5
    when 7
      6
    when 8
      7
    when 9
      8
    else 
      puts "That number is invalid."
    end 
  end
  
  def move(index, player_token = "X")
    @board[index] = "#{player_token}"
  end 
  
  def position_taken?(index) 
    if @board[index] != " "
      true 
    else 
      false 
    end 
  end 
    
  def valid_move?(index)
    if index > 8 || position_taken?(index) == true
      false 
    else 
      true
    end 
  end 
    
  def turn_count
    count = 0
    @board.each do |space|
      if space != " "
        count += 1 
      else 
        count 
      end 
    end 
    count
  end 
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else 
      "O"
    end 
  end 
  
  def turn
    turn = gets 
    proper_turn = input_to_index(turn)
    if valid_move(proper_turn) == false
      "invalid"
    else 
      @board[proper_turn] = current_player
    end 
  end 
  
  
  
  
  
end 