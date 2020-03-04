
class TicTacToe
  
  #attr_accessor :board
  
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [2,4,6]
                      ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(string)
    n_1 = string.to_i
    n_2 = n_1 - 1
    n_2
  end
  
  def move(index, token = "X")
    @board[index] = token
    @board
  end
  
  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end
  
  def valid_move?(index)
    if index >=0 && index < 9 && position_taken?(index) == false 
      true
    else
      false
    end
  end
  
  def turn_count
    counts = Hash.new(0)
    @board.each { |name| counts[name] += 1 }
    counts["X"] + counts["O"]
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def turn
  
    #https://learn.co/lessons/ruby-gets-input
    #1
    puts "Please enter your move"
    input = gets.strip
    index = input_to_index(input)
    result = valid_move?(index)
    player = current_player
    
    if result
      move(index, player)
      display_board
    else
      turn
    end

  end
  
  def won?
    WIN_COMBINATIONS.each do |single|
      
      result_1 = @board[single[0]]
      result_2 = @board[single[1]]
      result_3 = @board[single[2]]
  
      if result_1 == "X" && result_2 == "X" && result_3 == "X"
        return single
      elsif result_1 == "O" && result_2 == "O" && result_3 == "O"
        return single
      end
    end
    false
  end
  
  def full?
    result = @board.include? " "
    if result
      false
    else
      true
    end
  end
  
  def draw?
    if won? == true
      false
    elsif full? == true && won? == false
      true
    else
      false
    end
  end
  
  def over?
    if won?
      true
    elsif draw?
      true
    end
  end
  
  def winner
    winning_index = won?
    if winning_index == false
      return nil
    elsif @board[winning_index[0]] == "X"
      return "X"
    elsif @board[winning_index[0]] == "O"
      return "O"
    end
  end
  
  def play
    
    until over? == true
      turn
    end
  
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    
    end
  end
  
  
  
end
