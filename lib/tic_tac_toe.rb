class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end
  
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    return input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = "#{token}"
  end
  
  def position_taken?(index)
    if @board[index] == " "
      false 
    else
      true 
    end
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0? "X":"O"
  end
  
  def turn 
    puts "It's your turn! Pick your move by entering 1-9!"
    user_input = gets.strip
    index = input_to_index(user_input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
        @board[win_combo[0]] == @board[win_combo[1]] &&
      @board[win_combo[1]] == @board[win_combo[2]] &&
      (@board[win_combo[0]] == "X" || @board[win_combo[0]] == "O")
    end
  end
  
  def full? 
    @board.all?{|token| token == "X" || token == "O"} 
  end
  
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end
  
  def over?
    if draw? || won?
      true
    else
      false
    end
  end
  
  def winner
    winning_combo = won?
  if winning_combo
    @board[winning_combo[0]]
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