require 'pry'
# 67. Add Binary

# Given two binary strings a and b, return their sum as a binary string.

 

# Example 1:

# Input: a = "11", b = "1"
# Output: "100"
# Example 2:

# Input: a = "1010", b = "1011"
# Output: "10101"
 

# Constraints:

# 1 <= a.length, b.length <= 104
# a and b consist only of '0' or '1' characters.
# Each string does not contain leading zeros except for the zero itself.

# def add_binary(a, b)
#   res = ""
#   carry = 0
#   i, j = a.length-1, b.length-1
#   while i >= 0 || j >= 0 || carry == 1
#     # starting at the last digit of a and b, we add the last digit plus carry and prepend it to the result, this loops works from the last digit to the first
#     # the if guard statement is in place incase 1 binary is longer than the other, or worded another way, when either i or j become negative.
#     # in a binary addition problem, whenever the digit is 2 or greater, we -2 from it and carry it to the next digit, 
#     sum = carry
#     sum += a[i].to_i if i >= 0
#     sum += b[j].to_i if j >= 0
#     carry = sum / 2 
#     res.prepend((sum%2).to_s)
#     i-=1
#     j-=1
#   end
#   res
# end

def add_binary(a, b)
  #basically the same function but leaves out the extra declared sum
  i, j, carry, res = a.length, b.length, 0, ""
  while i > 0 || j > 0 || carry ==1
      carry += i <= 0 ? 0 : a[i-=1].to_i
      carry += j <= 0 ? 0 : b[j-=1].to_i
      res += (carry%2).to_s
      carry /= 2
  end
  res.reverse
end

puts add_binary("11", "1") #"100"
puts add_binary("1010", "1011") #"10101"