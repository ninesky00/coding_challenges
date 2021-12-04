require 'pry'
# 37. Sudoku Solver
# Write a program to solve a Sudoku puzzle by filling the empty cells.

# A sudoku solution must satisfy all of the following rules:

# Each of the digits 1-9 must occur exactly once in each row.
# Each of the digits 1-9 must occur exactly once in each column.
# Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
# The '.' character indicates empty cells.

 

# Example 1:


# Input: board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
# Output: [["5","3","4","6","7","8","9","1","2"],
          #  ["6","7","2","1","9","5","3","4","8"],
          #  ["1","9","8","3","4","2","5","6","7"],
          #  ["8","5","9","7","6","1","4","2","3"],
          #  ["4","2","6","8","5","3","7","9","1"],
          #  ["7","1","3","9","2","4","8","5","6"],
          #  ["9","6","1","5","3","7","2","8","4"],
          #  ["2","8","7","4","1","9","6","3","5"],
          #  ["3","4","5","2","8","6","1","7","9"]]
# Explanation: The input board is shown above and the only valid solution is shown below:


 

# Constraints:

# board.length == 9
# board[i].length == 9
# board[i][j] is a digit or '.'.
# It is guaranteed that the input board has only one solution.

#currrently not submitted to leetcode, pending on converting input from string to number
# and 0 to .

board = [[5,3,0,0,7,0,0,0,0],
         [6,0,0,1,9,5,0,0,0],
         [0,9,8,0,0,0,0,6,0],
         [8,0,0,0,6,0,0,0,3],
         [4,0,0,8,0,3,0,0,1],
         [7,0,0,0,2,0,0,0,6],
         [0,6,0,0,0,0,2,8,0],
         [0,0,0,4,1,9,0,0,5],
         [0,0,0,0,8,0,0,7,9]]

# board =     [[7,8,0,4,0,0,1,2,0],
# [6,0,0,0,7,5,0,0,9],
# [0,0,0,6,0,1,0,7,8],
# [0,0,7,0,4,0,2,6,0],
# [0,0,1,0,5,0,9,3,0],
# [9,0,4,0,6,0,0,0,5],
# [0,7,0,3,0,0,0,1,2],
# [1,2,0,0,0,7,4,0,0],
# [0,4,9,2,0,6,0,0,7]]

def solve_sudoku(bo)
  #find empty cell
  #insert options 1-9 based on sudoku constraints
  #repeat with next empty cell
  #until failed constraints
  #backtracking
  #set number to zero
  #increment previous number
  backtracks = 0 
  find = find_empty(bo)
  if !find
    return true
  else
    row, col = find
  end
  # row, col = find
  for i in 1..9
    # binding.pry
    if valid(bo, i, [row, col])
      # binding.pry
      bo[row][col] = i
      if solve_sudoku(bo)
        return true
      end
      bo[row][col] = 0
    end
  end
  return false
end


def valid(bo, num, pos)
  #check row
  # binding.pry
  for i in 0...bo[0].length
    if bo[pos[0]][i] == num && pos[1] != i 
      return false
    end
  end

  #check column
  for i in 0...bo.length
    if bo[i][pos[1]] == num && pos[0] != i
      return false
    end
  end

  #check box
  box_x = pos[1] / 3
  box_y = pos[0] / 3
  for i in box_y*3...box_y*3+3
    for j in box_x*3...box_x*3+3
      # binding.pry
      if bo[i][j] == num && [i, j] != pos
        return false 
      end
    end
  end
  return true
end

def find_empty(bo)
  for i in 0...bo.length 
    for j in 0...bo[0].length
      if bo[i][j] == 0
        return i, j
      end
    end
  end
  nil
end

# puts find_empty(board)
puts solve_sudoku(board)
# puts valid(board, 6, [0,3])