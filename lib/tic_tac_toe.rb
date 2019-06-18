require "pry"
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
    return user_input.to_i - 1
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
    index.between?(0, 9) && !position_taken?(index)
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
    turn_count % 2 == 0 ? "X" : "O"
  end 
  
  def turn
    puts "Please enter 1-9:"
    turn_input = gets.strip
    proper_turn = input_to_index(turn_input)
    if valid_move?(proper_turn)
      move(proper_turn, current_player)
      display_board
    else 
      turn 
    end 
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combination|
      if @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[0]] == @board[win_combination[2]]
        return win_combination
      end 
    end 
  end
  
  def full?
    if turn_count <= 8
      false
    else 
      true
    end 
  end 
  
  def draw? 
    full? && !won?
  end 
  
  def over?
    won? || draw?
  end 
  
  def winner
    return nil unless won?
    if @board[won?[0]] != " "
      @board[won?[0]]
    end 
  end
  
  
  def play
    until over?
      #binding.pry
      turn 
    end 
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!" 
    end 
  end 

end 