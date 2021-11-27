require 'pry'

# The count-and-say sequence is a sequence of digit strings defined by the recursive formula:

# countAndSay(1) = "1"
# countAndSay(n) is the way you would "say" the digit string from countAndSay(n-1), which is then converted into a different digit string.
# To determine how you "say" a digit string, split it into the minimal number of groups so that each group is a contiguous section all of the same character. Then for each group, say the number of characters, then say the character. To convert the saying into a digit string, replace the counts with a number and concatenate every saying.

# For example, the saying and conversion for digit string "3322251":


# Given a positive integer n, return the nth term of the count-and-say sequence.

 

# Example 1:

# Input: n = 1
# Output: "1"
# Explanation: This is the base case.
# Example 2:

# Input: n = 4
# Output: "1211"
# Explanation:
# countAndSay(1) = "1"
# countAndSay(2) = say "1" = one 1 = "11"
# countAndSay(3) = say "11" = two 1's = "21"
# countAndSay(4) = say "21" = one 2 + one 1 = "12" + "11" = "1211"
 

# Constraints:

# 1 <= n <= 30

#psudo code
# read the previous number
# iterate through the previous number
# count the number of times the number appears
# add the count and the number to the result
# return the result
def countAndSay(n)
    return "1" if n == 1
    prev = countAndSay(n-1)
    # recursive call for all the previous numbers
    result = ""
    # begin with an empty string
    i = 0
    # start with the base case
    
    binding.pry
    while i < prev.length
        # while i is less than previous string length
        # if prev.length is 1
        # loops once
        # if prev.length is 2
        # loops twice
        # so on and so forth
        count = 1
        # count begins at 1 for each number read

        while i < prev.length-1 && prev[i] == prev[i+1]
            #prev.length-1 because we are comparing the next number to the current number
            #while i is less than previous string length and the current character is the same as the next character
            count += 1
            # increment count when the current character is the same as the next character
            i += 1
            # increment loop
        end
        #notice that the loop is broken when the current character is not the same as the next character
        #therefore the count is the number of times the current character appears
        #and then reset back to 1
        result += count.to_s + prev[i]
        # add the count and the character to the result
        i += 1
        # increment loop
        # the previous i+=1 only happens when the current character is the same as the next character
    end
    result
end

# puts countAndSay(1)
puts countAndSay(4)
