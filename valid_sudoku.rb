require 'pry'
# 36. Valid Sudoku
# Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

# Each row must contain the digits 1-9 without repetition.
# Each column must contain the digits 1-9 without repetition.
# Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
# Note:

# A Sudoku board (partially filled) could be valid but is not necessarily solvable.
# Only the filled cells need to be validated according to the mentioned rules.
 

# Example 1:


# Input: board = 
# [["5","3",".",".","7",".",".",".","."]
# ,["6",".",".","1","9","5",".",".","."]
# ,[".","9","8",".",".",".",".","6","."]
# ,["8",".",".",".","6",".",".",".","3"]
# ,["4",".",".","8",".","3",".",".","1"]
# ,["7",".",".",".","2",".",".",".","6"]
# ,[".","6",".",".",".",".","2","8","."]
# ,[".",".",".","4","1","9",".",".","5"]
# ,[".",".",".",".","8",".",".","7","9"]]
# Output: true
# Example 2:

# Input: board = 
# [["8","3",".",".","7",".",".",".","."]
# ,["6",".",".","1","9","5",".",".","."]
# ,[".","9","8",".",".",".",".","6","."]
# ,["8",".",".",".","6",".",".",".","3"]
# ,["4",".",".","8",".","3",".",".","1"]
# ,["7",".",".",".","2",".",".",".","6"]
# ,[".","6",".",".",".",".","2","8","."]
# ,[".",".",".","4","1","9",".",".","5"]
# ,[".",".",".",".","8",".",".","7","9"]]
# Output: false
# Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
 

# Constraints:

# board.length == 9
# board[i].length == 9
# board[i][j] is a digit 1-9 or '.'.

def valid_sudoku(board)
  #need to check each row is valid
  #in this case, ignore the .s as they represent empty space
  #check each of the numbers in the column, ie first row 5, 3, 7, should be valid
  board.each do |row|
    return false if valid_nine?(row) != true
  end

  #need to check each column is valid, therefore we can transpose and check row again
  #since it is a 9x9 grid, transposing board will give the column, 
  board.transpose.each do |col|
    return false if valid_nine?(col) != true
  end

  return false if valid_box?(board) != true
  #need to check if each 3 by 3 is valid, ie [5, 3, ., 6, ., ., . 9, 8] being the first 3 by 3
  true
end

def valid_nine?(row)
  #do nothing with .s
  #could purge the .s and check the remaining numbers (5, 3, 7)
  #but doing that will probably mean the implementation is not very efficient
  #going to use a hash map to check for duplicates
  map = {}
  row.each do |num|
    next if num == "."
    if map[num]
      return false
    else 
      map[num] = true
    end
  end
  true
end

def valid_box?(board)
  #brute forcing it to slice in to 3 by 3s to then check the row
  #not a very dynamic solution, the board is assumed to be 9*9
  #an optimized solution can probably use 2 pointers 1 for row and 1 for column
  #will need to look into a different attempt to do that
  left3, mid3, right3, threes = [], [], [], []
  board.each do |row|
    left3 << row[0..2]
    mid3 << row[3..5]
    right3 << row[6..8]
  end
  [left3, mid3, right3].flatten.each_slice(9) {|a| threes << a}
  threes.all? do |row|
    valid_nine?(row) == true
  end
end

# puts valid_nine?([".",".",".",".","5",".","5",".","."])

puts valid_sudoku([ ["5","3",".",".","7",".",".",".","."],
                    ["6",".",".","1","9","5",".",".","."],
                    [".","9","8",".",".",".",".","6","."],
                    ["8",".",".",".","6",".",".",".","3"],
                    ["4",".",".","8",".","3",".",".","1"],
                    ["7",".",".",".","2",".",".",".","6"],
                    [".","6",".",".",".",".","2","8","."],
                    [".",".",".","4","1","9",".",".","5"],
                    [".",".",".",".","8",".",".","7","9"]])

puts valid_sudoku([["8","3",".",".","7",".",".",".","."],
                   ["6",".",".","1","9","5",".",".","."],
                   [".","9","8",".",".",".",".","6","."],
                   ["8",".",".",".","6",".",".",".","3"],
                   ["4",".",".","8",".","3",".",".","1"],
                   ["7",".",".",".","2",".",".",".","6"],
                   [".","6",".",".",".",".","2","8","."],
                   [".",".",".","4","1","9",".",".","5"],
                   [".",".",".",".","8",".",".","7","9"]])

puts valid_sudoku([["7",".",".",".","4",".",".",".","."],
                   [".",".",".","8","6","5",".",".","."],
                   [".","1",".","2",".",".",".",".","."],
                   [".",".",".",".",".","9",".",".","."],
                   [".",".",".",".","5",".","5",".","."],
                   [".",".",".",".",".",".",".",".","."],
                   [".",".",".",".",".",".","2",".","."],
                   [".",".",".",".",".",".",".",".","."],
                   [".",".",".",".",".",".",".",".","."]])