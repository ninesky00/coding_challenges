require 'pry'

# 15. 3Sum

# Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

# Notice that the solution set must not contain duplicate triplets.

 

# Example 1:

# Input: nums = [-1,0,1,2,-1,-4]
# Output: [[-1,-1,2],[-1,0,1]]
# Example 2:

# Input: nums = []
# Output: []
# Example 3:

# Input: nums = [0]
# Output: []
 

# Constraints:

# 0 <= nums.length <= 3000
# -105 <= nums[i] <= 105
# Accepted
# 1,615,707
# Submissions
# 5,386,248


def three_sum(nums)
    sums = []
    nums.sort!
    nums.each_with_index do |num, idx|
        next if num == nums[idx-1] && idx > 0
        target = 0 - num
        sets = two_sum(nums[idx+1..-1], target)
        sets.each do |subset|
            sums << (subset << num)
        end
    end
    sums.uniq
end

def two_sum(nums, target)
    map = {}
    output = []
    nums.each do |int|
        if map[target - int]
            output << [int, (target-int)]
        else
            map[int] = int
        end
    end
    output
end


print three_sum([-1,0,1,2,-1,-4])