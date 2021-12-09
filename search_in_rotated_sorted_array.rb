# 33. Search in Rotated Sorted Array
# There is an integer array nums sorted in ascending order (with distinct values).

# Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

# Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

# You must write an algorithm with O(log n) runtime complexity.

 

# Example 1:

# Input: nums = [4,5,6,7,0,1,2], target = 0
# Output: 4
# Example 2:

# Input: nums = [4,5,6,7,0,1,2], target = 3
# Output: -1
# Example 3:

# Input: nums = [1], target = 0
# Output: -1
 

# Constraints:

# 1 <= nums.length <= 5000
# -104 <= nums[i] <= 104
# All values of nums are unique.
# nums is an ascending array that is possibly rotated.
# -104 <= target <= 104

def search(nums, target)
  # this is similiar to find min in rotated sorted array except we are looking for a target
  # implentation will be binary search
  i = 0 
  j = nums.length-1
  while i < j
    #if mid is greater than target, it doesn't not tell us that the target is to the left
    # because the array has been rotated, we can try to find the range in which the target 
    # should exist, if mid > j telling us that range between mid and j is not increasing or partially
    # otherwise if mid is < j, we know that mid through j is increasing, in the same sense if i <= mid
    # we know that i through mid is increasing, otherwise the pviot gap is in between i and mid.
    #Now we have to determine where does the target sit, a layered if statements in if nums[i] <= nums[mid]
    # to indicate moving the left pointer or the right pointer. 

    mid = (i + j) / 2
    if nums[mid] == target
      return mid
    end
    
    if nums[i] <= nums[mid]
      if nums[i] <= target && target < nums[mid]
        j = mid - 1
      else
        i = mid + 1
      end
    else
      if nums[mid] < target && target <= nums[j]
        i = mid + 1
      else
        j = mid - 1
      end
    end  
  end
  nums[i] == target ? i : -1
end

puts search([4,5,6,7,0,1,2], 0)
puts search([4,5,6,7,0,1,2], 3)
puts search([1], 0)