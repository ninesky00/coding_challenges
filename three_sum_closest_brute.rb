require 'pry'

# 16. 3Sum Closest

# Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.

# Return the sum of the three integers.

# You may assume that each input would have exactly one solution.

 

# Example 1:

# Input: nums = [-1,2,1,-4], target = 1
# Output: 2
# Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
# Example 2:

# Input: nums = [0,0,0], target = 1
# Output: 0
 

# Constraints:

# 3 <= nums.length <= 1000
# -1000 <= nums[i] <= 1000
# -104 <= target <= 104

def three_sum_closest(nums, target)
    hash = {}
    three_sums = nums.combination(3).map(&:sum)
    three_sums.min_by do |sum|
        (target - sum).abs
    end
end




print three_sum_closest([1,1,1,0], -100)
# print three_sum_closest([-1,2,1,-4], 1)
# print three_sum_closest([0,2,1,-3], 1)