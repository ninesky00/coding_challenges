require 'pry'
# 463. Island Perimeter
# You are given row x col grid representing a map where grid[i][j] = 1 represents land and grid[i][j] = 0 represents water.

# Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).

# The island doesn't have "lakes", meaning the water inside isn't connected to the water around the island. One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.

 

# Example 1:


# Input: grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
# Output: 16
# Explanation: The perimeter is the 16 yellow stripes in the image above.
# Example 2:

# Input: grid = [[1]]
# Output: 4
# Example 3:

# Input: grid = [[1,0]]
# Output: 4
 

# Constraints:

# row == grid.length
# col == grid[i].length
# 1 <= row, col <= 100
# grid[i][j] is 0 or 1.
# There is exactly one island in grid.

# 0 for water, 1 for land
# grid for first input
  # [0,1,0,0],
  # [1,1,1,0],
  # [0,1,0,0],
  # [1,1,0,0]

# need to calculate total perimeter
# every side that is connected to land is 4 - sides
# should i be looking for many sides are connected?
# or check for left, right, up, down of each land?


def island_perimeter(grid)
  #checking each land up right left down
  peri = 0
  for i in 0...grid.length do 
    for j in 0...grid[0].length do 
      if grid[i][j] == 1
        #check surrounding if water or edge
        peri += 1 if j+1 == grid[0].length || grid[i][j+1] == 0
        peri += 1 if j-1 < 0 || grid[i][j-1] == 0
        peri += 1 if i+1 == grid.length || grid[i+1][j] == 0
        peri += 1 if i-1 < 0 || grid[i-1][j] == 0
      end
    end
  end
  peri
end

# puts island_perimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]) # 16
# puts island_perimeter([[1]]) # 4
# puts island_perimeter([[1,0]]) #4
puts island_perimeter([[0,1]]) # 4