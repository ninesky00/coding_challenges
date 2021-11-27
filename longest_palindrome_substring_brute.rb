require 'pry'

# Given a string s, return the longest palindromic substring in s.

 

# Example 1:

# Input: s = "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.
# Example 2:

# Input: s = "cbbd"
# Output: "bb"
# Example 3:

# Input: s = "a"
# Output: "a"
# Example 4:

# Input: s = "ac"
# Output: "a"
 

# Constraints:

# 1 <= s.length <= 1000
# s consist of only digits and English letters.
# Accepted
# 1,565,471
# Submissions
# 4,973,631

def longest_palindrome(s)
    max_length = 0
    set = ""
    for i in 0...s.length 
        # j=i # I added this to fix 
        for j in 0...s.length #I think the first j loop incremented j to s.length, therefore during the 2nd and thereafter loops, it just skips the following steps
            window = j - i + 1
            subs = s[i..j]
            # binding.pry
            if window > max_length && palindrome(subs)
                max_length = window
                set = subs
            end
        end
    end
    set
end

def palindrome(t)
    t == t.reverse
end

# puts longest_palindrome("babad")
# puts longest_palindrome("cbbd")
# puts longest_palindrome("a")
# puts longest_palindrome("abb")
puts longest_palindrome("eabcb")