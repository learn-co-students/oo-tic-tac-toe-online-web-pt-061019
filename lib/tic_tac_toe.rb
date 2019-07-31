class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
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
        user_input.to_i-1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == " "
            return false
        end #return @board[index] != " "
        true
    end

    def valid_move?(index)
        if index < 9 && index > -1 && position_taken?(index) == false
            return true
        end
        return false
    end

    def turn_count
        turns = 0
        @board.each do |token|
            if token == "X" || token == "O"
                turns+=1
            end
        end
        return turns
    end

    def current_player
        if turn_count % 2 == 0
            return "X"
        end
        return "O"
    end

    def turn
        is_valid = false
        while !is_valid
            puts "Enter an Index"
            input = gets
            index = input_to_index(input)

            is_valid = valid_move?(index)
        end

        token = current_player
        move(index, token)
        display_board
    end

    def won?
        # if @board[0] == "O" && @board[1] == "O" && @board[2] == "0"
        #     return [0,1,2]
        # elsif @board[0] == "X" && @board[1] == "X" && @board[2] == "X"
        #     return [0,1,2]
        # end
        # return false

        WIN_COMBINATIONS.each do |combination|
            if @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
                return combination
            elsif @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
                return combination
            end
        end
        return false
    end


    def full?
        puts turn_count
        if turn_count == 9
            return true
        else
            return false
        end
    end

    def draw?
        full? && !won?
    end

    def over?
        won? != false || full?
    end

    def winner
        combination = won?
        if combination == false
            return nil
        end
        index = combination[0]
        return @board[index]
    end

    def play
        while !over? && !draw?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
    
        end
    end

end
