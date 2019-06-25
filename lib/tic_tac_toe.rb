class TicTacToe

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1;
  end

  def move(index, token = X)
    @board[index] = "#{token}"
  end

  def position_taken?(index)
    if(@board[index]=="X" || @board[index]=="O")
      return true
    end
    return false
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    turn = 0
    @board.each do |taken|
      if taken == "O" || taken == "X"
        turn += 1
      end
    end
    turn
  end

  def current_player
    turn_count % 2 == 0? "X":"O"
  end

  def turn
    while true
      puts "Please enter your turn location (between 1-9)"
      input = gets.chomp()
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        "Invalid Move please enter 1-9"
      end
    end
    index
  end

  def won?
  winning_combination=nil
  winning_combination = WIN_COMBINATIONS.detect do |combination|
    @board[combination[0]] != " " && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
  end
end

def full?
  !@board.any?{|i| i==" "}
end

def draw?
  true if !won? && full?
end

def over?
  true if won? || draw? || full?
end

def winner
  winning_combo = won?
  if winning_combo
    @board[winning_combo[0]]
  else
    nil
  end
end

def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end



end
