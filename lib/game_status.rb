require "pry"

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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

def won?(board)
  win_check =
  WIN_COMBINATIONS.each do |win_combination|

    position_1 = win_combination[0]
    position_2 = win_combination[1]
    position_3 = win_combination[2]

    if position_taken?(board, position_1) && board[position_1] == board[position_2] && board[position_2] == board[position_3]
      return win_combination
    end
  end

  if win_check != 0
    return false
  end

end

def full?(board)
  board.all? do |piece|
    piece == "X" || piece == "O"
  end
end

def draw?(board)
  #returns true if the board is full but not won
  if won?(board) == true
    return false

  elsif won?(board) == false
    if full?(board) == true
      return true

    elsif full?(board) == false
      return false
    end
  end
end

def over?(board)
  if draw?(board) == true
    return true
  elsif full?(board) == true
    return true
  elsif won?(board) != false
    return true
  else
    return false
  end
end

def winner(board)
  #return the token that has won the board
  winning_array = []

  if won?(board) == false
    return nil
  elsif won?(board) != false
    winning_array = won?(board)
    puts winning_array.inspect
    return board[winning_array[0]]
  end
end
