# 53. Maximum Subarray

# Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

# A subarray is a contiguous part of an array.

 

# Example 1:

# Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
# Output: 6
# Explanation: [4,-1,2,1] has the largest sum = 6.
# Example 2:

# Input: nums = [1]
# Output: 1
# Example 3:

# Input: nums = [5,4,-1,7,8]
# Output: 23
 

# Constraints:

# 1 <= nums.length <= 105
# -104 <= nums[i] <= 104

# started to implement sliding window but realized it wasn't needed since 
# we output the max sum and not the contiguous subarray



def max_sub_array(nums)
  #find the maximum sum possible in the array, elements has to be contiguous (next to each other)
  maxsum = 0
  cursum = nums[0]
  nums.each do |num|
    cursum = 0 if cursum < 0
    cursum += num
    maxsum = [maxsum, cursum].max 
  end
  maxsum
end

puts max_sub_array([-2,1,-3,4,-1,2,1,-5,4])
# puts max_sub_array([5,4,-1,7,8])
# puts return_contiguous_subarr([-2,1,-3,4,-1,2,1,-5,4])