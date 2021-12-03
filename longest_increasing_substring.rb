require 'pry'
# 300. Longest Increasing Subsequence
# Given an integer array nums, return the length of the longest strictly increasing subsequence.

# A subsequence is a sequence that can be derived from an array by deleting some or no elements without changing the order of the remaining elements. For example, [3,6,2,7] is a subsequence of the array [0,3,1,6,2,2,7].

 

# Example 1:

# Input: nums = [10,9,2,5,3,7,101,18]
# Output: 4
# Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
# Example 2:

# Input: nums = [0,1,0,3,2,3]
# Output: 4
# Example 3:

# Input: nums = [7,7,7,7,7,7,7]
# Output: 1
 

# Constraints:

# 1 <= nums.length <= 2500
# -104 <= nums[i] <= 104
 

# Follow up: Can you come up with an algorithm that runs in O(n log(n)) time complexity?

# this passes the test for the example inputs but fails when inputs include 
# numbers of increasing sequence before the minimum number, as the result array only
# compares the last element of the array.
# def length_of_lis(nums)
#   res = [nums[0]]
#   nums[1..-1].each do |num|
#     if res.last < num
#       res << num
#     elsif res.last > num
#       res[-1] = num
#     end
#   end
#   res.length
# end

def length_of_lis(nums)
  #using depths first search, memorized every possible outcome at each index, 
  #return the maximum possible outcome
  res = [1] * nums.length
  for i in 0..nums.length-1 do 
    for j in 0...i do 
      if nums[j] < nums[i]
        res[i] = [res[i], 1+res[j]].max
      end
    end
  end
  res.max
end

puts length_of_lis([10,9,2,5,3,7,101,18]) #  > 4
puts length_of_lis([0,1,0,3,2,3]) # > 4
puts length_of_lis([7,7,7,7,7,7,7]) # > 1