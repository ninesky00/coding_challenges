require 'pry'
# 290. Word Pattern
# Easy
# 3387
# Given a pattern and a string s, find if s follows the same pattern.

# Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

 

# Example 1:

# Input: pattern = "abba", s = "dog cat cat dog"
# Output: true
# Example 2:

# Input: pattern = "abba", s = "dog cat cat fish"
# Output: false
# Example 3:

# Input: pattern = "aaaa", s = "dog cat cat dog"
# Output: false
 

# Constraints:

# 1 <= pattern.length <= 300
# pattern contains only lower-case English letters.
# 1 <= s.length <= 3000
# s contains only lowercase English letters and spaces ' '.
# s does not contain any leading or trailing spaces.
# All the words in s are separated by a single space.

def word_pattern(pattern, string)
  map = Hash.new
  string = string.split(" ")
  pattern = pattern.chars
  return false if pattern.length != string.length
  pattern.each_with_index do |letter, idx|
    # binding.pry
    if map[letter]
      return false if map[letter] != string[idx]
    else
      map[letter] = string[idx]
    end 
  end
  map.values == map.values.uniq
end

puts word_pattern("abba", "dog cat cat dog") # true
puts word_pattern("abba", "dog cat cat fish") # false
puts word_pattern("aaaa", "dog cat cat dog") # false
