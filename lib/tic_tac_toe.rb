class TicTacToe


  WIN_COMBINATIONS =[[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]

  def initialize(board = nil) #board is empty
    @board = board || Array.new(9, " ") #initialize or create a new array
  end
  #it 'prints arbitrary arrangements of the board' do
    # board = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]
    # game = TicTacToe.new
    # game.instance_variable_set(:@board, board)
    #
    # output = capture_puts{ game.display_board }
    #
    # expect(output).to include(" X | X | X ")
    # expect(output).to include("-----------")
    # expect(output).to include(" X | O | O ")
    # expect(output).to include("-----------")
    # expect(output).to include(" X | O | O ")
    #
    #
    # board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    # game.instance_variable_set(:@board, board)
    #
    # output = capture_puts{ game.display_board }
    #
    # expect(output).to include(" X | O | X ")
    # expect(output).to include("-----------")
    # expect(output).to include(" O | X | X ")
    # expect(output).to include("-----------")
    # expect(output).to include(" O | X | O ")

  def input_to_index
    puts "Please input a number between 1-9!"
    choice = gets.strip
    choice.to_i
  end


  def move(position, char)
    @board[position] = char
  end

  def position_taken?(position)
      @board[position]==("X") || @board[position]==("O")  #allows position if it is nil
  end

  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
  end

  def turn_count
    @board.count{|char|char=="X" || char=="O"}
    #nuboard = @board.reject { |c| c.empty? }.join
    #occupied_spaces = nuboard.count("X")+nuboard.count("O")
    #occupied_spaces
  end

  








def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
end
