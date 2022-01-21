# 231. Power of Two
# Given an integer n, return true if it is a power of two. Otherwise, return false.

# An integer n is a power of two, if there exists an integer x such that n == 2x.

 

# Example 1:

# Input: n = 1
# Output: true
# Explanation: 20 = 1
# Example 2:

# Input: n = 16
# Output: true
# Explanation: 24 = 16
# Example 3:

# Input: n = 3
# Output: false
 

# Constraints:

# -231 <= n <= 231 - 1

def is_power_two(n)
  return false if n < 0
  # 2 to any power cannot yield a negative number
  Math.log2(n) % 1 == 0
  # utilizing log base of 2 and module % 1 checking if it is a whole number
  # this solution relies heavily on arithmatic
  # will try to solve it using bit manipulation in a later date
end

puts is_power_two(1) #true
puts is_power_two(16) #true
puts is_power_two(3) #false
puts is_power_two(-16) #false