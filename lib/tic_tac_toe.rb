class TicTacToe

  attr_reader :board

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], # et cetera, creating a nested array for each win combination
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
    return index
  end

  def move(index, move="X")
    @board[index] = move
  end

  def position_taken?(index)
    @board[index] != " " ? true : false
    # !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0, 8) && !self.position_taken?(index)
    # @board[index] == " " ? true : false && index == (/[0-8]/)
    # !self.position_taken(index)
  end

  def turn_count
    @board.count {|pos| pos == "X" || pos == "O"}
  end

  def current_player
    self.turn_count % 2 != 0 ? "O" : "X"
  end

  def turn
    puts "Where would you like to move?"
    input = gets.strip
    index = self.input_to_index(input)
    if self.valid_move?(index)
      # player = self.current_player
      self.move(index, self.current_player)
      self.display_board
    else
      self.turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect {|win_combo| win_combo.all?{|pos| @board[pos]=="X"} || win_combo.all?{|pos| @board[pos]=="O"}}
  end

  def full?
    self.turn_count == 9
  end

  def draw?
    self.full? && !self.won?
  end

  def over?
    self.draw? || self.won?
  end

  def winner
    # if !won?
    #   nil
    # elsif won?.all?{|pos| @board[pos]=="X"}
    #   "X"
    # # elsif won?.all?{|pos| @board[pos]=="O"}
    # #   "O"
    # else
    #   "O"
    # end
    return nil unless won?
    @board[self.won?[0]]
  end

  def play
    until over?
      turn
    end
    puts "Congratulations #{self.winner}!" if self.won?
    puts "Cat's Game!" if self.draw?
  end

end
