require 'pry'
# Given an integer array nums, find a contiguous non-empty subarray within the array that has the largest product, and return the product.

# It is guaranteed that the answer will fit in a 32-bit integer.

# A subarray is a contiguous subsequence of the array.

 

# Example 1:

# Input: nums = [2,3,-2,4]
# Output: 6
# Explanation: [2,3] has the largest product 6.
# Example 2:

# Input: nums = [-2,0,-1]
# Output: 0
# Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
 

# Constraints:

# 1 <= nums.length <= 2 * 104
# -10 <= nums[i] <= 10
# The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

# this problem is one step away from the max subarray problem, added the difficulty 
# of handling multiplication, as mulptiliying negative numbers switches between 
# the maximum and minimum values, also the added case of dealing with multiplying 0s.
# the solution is to always keep track of the current max and min values, and
# update them as we go.

def max_product(nums)
    curmax, curmin, max_product = 1, 1, -999
    nums.each do |num|
        curmax, curmin = [curmax * num, curmin * num, num].max, [curmax * num, curmin * num, num].min
        max_product = [max_product, curmax, curmin].max
    end
    max_product
end

puts max_product([2,3,-2,4])
puts max_product([-2,0,-1])