class TicTacToe
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
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
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end
  
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8)
      true
    else
      false
    end
  end
  
  def turn_count
    @board.count{|index| index == "X" || index == "O"}
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "Please choose a position between 1-9"
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
    WIN_COMBINATIONS.detect do |w_combo|
      w_combo1 = @board[w_combo[0]]
      w_combo2 = @board[w_combo[1]]
      w_combo3 = @board[w_combo[2]]
      
      w_combo1 == "X" && w_combo2 == "X" && w_combo3 == "X" ||
      w_combo1 == "O" && w_combo2 == "O" && w_combo3 == "O" 
    end
  end
  
  def full?
    !@board.any? {|i| i == "" || i == " "}
  end
    
  def draw?
    !won? && full?
  end
  
  def over?
    won? || full?
  end
  
  def winner
    if won?
      @board[won?[0]]
    end
  end
  
  def play
    until over?
    turn
    draw.detect
  end
    if over?
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
  end
end