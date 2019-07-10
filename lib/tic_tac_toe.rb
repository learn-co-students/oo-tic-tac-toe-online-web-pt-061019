class TicTacToe


  WIN_COMBINATIONS =[[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def play
  while over? == false
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

  def input_to_index
    puts "Please choose a number from 1-9."
    player_input = gets.chomp
    player_input = input.to_i - 1
    index = player_input #number is the index location where "x" or "o" are placed.
  end

  def position_taken
    if @board[index]==nil
      move(index,turn_count)
    else
      puts "Try another location!."
    end
  end

  def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
  end

  def turn_count(board="X")
  turn_count = 0
  board.count{|token| token == "X" || token == "O"}
  turn_count +=1
  turn_count
  end

  def move(index,turn_count)
    @board[index]==turn_count
  end

  def valid_move(display_board,index)
    @board[index].each {|index| num==[1..8]} && @board[index]==nil
  end

  def turn
    input_to_index
    if valid_move
      move
    puts display_board#places mark on board index location.
    else
      puts "Invalid move! Please choose again!"
  end
end

def full?(board)
   board.all?{|space| space !=nil}
end

  def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end
  

def won?(board)
if  board_display = board.each_slice(3).to_a
win_combination = board_display.each{|x|[x]==WIN_COMBINATIONS}
winner
else
  full?
end
end

def winner(win_combination)
  if win_combination=="X"
    puts " Hurray! X has won the game!"
  else
     puts " Hurray! O has won the game!"

   end
 end

def draw?(board)
  if !won?(board) && full?(board)
    puts "Cat's Game"
  else
    return false
  end
end



  def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
end
