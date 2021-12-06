# 153. Find Minimum in Rotated Sorted Array
# Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,2,4,5,6,7] might become:

# [4,5,6,7,0,1,2] if it was rotated 4 times.
# [0,1,2,4,5,6,7] if it was rotated 7 times.
# Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].

# Given the sorted rotated array nums of unique elements, return the minimum element of this array.

# You must write an algorithm that runs in O(log n) time.

 

# Example 1:

# Input: nums = [3,4,5,1,2]
# Output: 1
# Explanation: The original array was [1,2,3,4,5] rotated 3 times.
# Example 2:

# Input: nums = [4,5,6,7,0,1,2]
# Output: 0
# Explanation: The original array was [0,1,2,4,5,6,7] and it was rotated 4 times.
# Example 3:

# Input: nums = [11,13,15,17]
# Output: 11
# Explanation: The original array was [11,13,15,17] and it was rotated 4 times. 
 

# Constraints:

# n == nums.length
# 1 <= n <= 5000
# -5000 <= nums[i] <= 5000
# All the integers of nums are unique.
# nums is sorted and rotated between 1 and n times.

def find_min(nums)
  #the problem asked for O log n time complexity
  #the only way I know how is with binary search
  #although I believe the ruby built in min function is O log n
  i = 0
  j = nums.length-1
  while i < j
    #the difference in implementation from normal binary search is we are
    # searching for minimum and that the array sorted but rotated,
    # meaning the array is broken into 2 sorted arrays.
    #Therefore if the middle number is greater than the last number,
    # we know that the smallest number must be to the right, for the right number to 
    # be smaller than the middle number, the beginning of the sorted array must be 
    # to the right. So we move the left pointer to mid + 1.
    #If the middle number is less than the last number,
    # then we know the min must be the left or the middle number itself, 
    #so we move the right pointer to mid.

    mid = (i + j) / 2
    if nums[mid] > nums[j]
      i = mid + 1
    else
      j = mid
    end
  end
  nums[j]
end

puts find_min([3,4,5,1,2])
puts find_min([4,5,6,7,0,1,2])
puts find_min([11,13,15,17])
