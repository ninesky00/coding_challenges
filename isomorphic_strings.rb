require 'pry'
# 205. Isomorphic Strings
# Given two strings s and t, determine if they are isomorphic.

# Two strings s and t are isomorphic if the characters in s can be replaced to get t.

# All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

 

# Example 1:

# Input: s = "egg", t = "add"
# Output: true
# Example 2:

# Input: s = "foo", t = "bar"
# Output: false
# Example 3:

# Input: s = "paper", t = "title"
# Output: true
 

# Constraints:

# 1 <= s.length <= 5 * 104
# t.length == s.length
# s and t consist of any valid ascii character.

def is_isomorphic(s, t)
  map = {}
  i = 0
  while i < s.length do
    if map.key?(s[i])
      return false if map[s[i]] != t[i]
    else
      map[s[i]] = t[i]
    end
    i+=1
  end
  map.values.uniq == map.values
end

puts is_isomorphic("egg", "add") #true
puts is_isomorphic("foo", "bar") #false
puts is_isomorphic("paper", "title") #true