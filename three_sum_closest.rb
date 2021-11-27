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
    for i in 0...nums.length do 
        two_sum_target = target - nums[i]
        index = two_sum_target(nums[i]..nums[-1], two_sum_target)
        sum = index.unshift(nums[i])&:sum
        sum = [sum, ]
    end
end

def two_sum_closest(nums, target)
    i, j = 0, nums.length-1
    left, right = 0, 0 
    diff = nums.max
    while i < j do 
        sum = nums[i] + nums[j]
        if (sum - target).abs < diff
            diff = (sum - target).abs
            left = i
            right = j
        end
        if sum < target
            i += 1
        else
            j -= 1
        end
    end
    [nums[left], nums[right]]
end


print three_sum_closest([1,1,1,0], -100)
# print three_sum_closest([-1,2,1,-4], 1)
# print three_sum_closest([0,2,1,-3], 1)