require 'pry'

# Given a string s, find the length of the longest substring without repeating characters.

 

# Example 1:

# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.
# Example 2:

# Input: s = "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.
# Example 3:

# # Input: s = "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
# Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
# Example 4:

# Input: s = ""
# Output: 0
 

# Constraints:

# 0 <= s.length <= 5 * 104
# s consists of English letters, digits, symbols and spaces.

def length_of_longest_substring(s)
    i = 0
    j = 0
    set = []
    maxWin = 0 
    while i < s.length do 
        while set.include?(s[i]) do 
            set.delete(s[j])
            j+=1
        end
        set.push(s[i])
        maxWin = [maxWin, i - j + 1].max
        i+=1
    end
    maxWin
end

puts length_of_longest_substring("abcabcbb")
# puts length_of_longest_substring("bbbbb")
# puts length_of_longest_substring("pwwkew")
