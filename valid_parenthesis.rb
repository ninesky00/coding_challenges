require 'pry'

# 20. Valid Parentheses
# Easy

# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# An input string is valid if:

# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
 

# Example 1:

# Input: s = "()"
# Output: true
# Example 2:

# Input: s = "()[]{}"
# Output: true
# Example 3:

# Input: s = "(]"
# Output: false
# Example 4:

# Input: s = "([)]"
# Output: false
# Example 5:

# Input: s = "{[]}"
# Output: true
 

# Constraints:

# 1 <= s.length <= 104
# s consists of parentheses only '()[]{}'.

def is_valid(s)
  return false if s.length < 2
  brackets = {"(" => ")", "[" => "]", "{" => "}"}
  stack = []
  s.chars do |char|
      if brackets[char]
          stack << char
      else
          return false if brackets[stack.pop] != char
      end
  end
  stack.empty?
end

puts is_valid("()")
puts is_valid("()[]{}")
puts is_valid("(]")
puts is_valid("[")
puts is_valid("((")