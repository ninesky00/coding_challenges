require 'pry'

# Given an integer columnNumber, return its corresponding column title as it appears in an Excel sheet.

# For example:

# A -> 1
# B -> 2
# C -> 3
# ...
# Z -> 26
# AA -> 27
# AB -> 28 
# ...
 

# Example 1:

# Input: columnNumber = 1
# Output: "A"
# Example 2:

# Input: columnNumber = 28
# Output: "AB"
# Example 3:

# Input: columnNumber = 701
# Output: "ZY"
# Example 4:

# Input: columnNumber = 2147483647
# Output: "FXSHRXW"
 

# Constraints:

# 1 <= columnNumber <= 231 - 1

def convert_to_title(num)
  result = ""
  alphabet = ("A".."Z").to_a
  while num > 0
    result = alphabet[(num-1) % 26] + result
    num = (num - 1) / 26
  end
  result
end

puts convert_to_title(1)
puts convert_to_title(28)
puts convert_to_title(701)
puts convert_to_title(2147483647)

