require 'pry'


# Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

 

# Example 1:

# Input: strs = ["flower","flow","flight"]
# Output: "fl"
# Example 2:

# Input: strs = ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.
 

# Constraints:

# 1 <= strs.length <= 200
# 0 <= strs[i].length <= 200
# strs[i] consists of only lower-case English letters.

def longest_common_prefix(strs)
  common = ""
  return strs[0] if strs.length < 2
  for i in 0..strs[0].size
      char = strs[0][i]
      return common unless char
      
      strs.each do |str|
          return common if str[i] != char
      end
      common += char
  end
end

# puts longest_common_prefix(["flower","flow","flight"])
# puts longest_common_prefix(["a"])
# puts longest_common_prefix([""])
puts longest_common_prefix(["",""])
