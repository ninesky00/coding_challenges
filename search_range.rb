require 'pry'

# 34. Find First and Last Position of Element in Sorted Array

# Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

# If target is not found in the array, return [-1, -1].

# You must write an algorithm with O(log n) runtime complexity.

 

# Example 1:

# Input: nums = [5,7,7,8,8,10], target = 8
# Output: [3,4]
# Example 2:

# Input: nums = [5,7,7,8,8,10], target = 6
# Output: [-1,-1]
# Example 3:

# Input: nums = [], target = 0
# Output: [-1,-1]
 

# Constraints:

# 0 <= nums.length <= 105
# -109 <= nums[i] <= 109
# nums is a non-decreasing array.
# -109 <= target <= 109

def search_range(nums, target)
    #left and right bound
    first = first_pos(nums, target)
    last = first_pos(nums, target + 1) -1
    #if target doesn't exist, index of target + 1 -1 should be is less than first
    if first <= last
        return [first, last]
    else
        return [-1, -1]
    end
end

#binary search target index, reference lootcode # 35 search_insert
def first_pos(nums, target)
    first, lower, upper = nums.size, 0 , nums.size-1
    while lower <= upper do 
        mid = lower + ((upper - lower) / 2)
        if nums[mid] >= target
            first = mid
            upper = mid - 1
        else
            lower = mid + 1
        end
    end
    return first
end


puts search_range([5,7,7,8,8,10], 8)
puts search_range([5,7,7,8,8,10], 6)
puts search_range([], 0)