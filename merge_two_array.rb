require 'pry'
# You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.

# Merge nums1 and nums2 into a single array sorted in non-decreasing order.

# The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.

 

# Example 1:

# Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
# Output: [1,2,2,3,5,6]
# Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
# The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
# Example 2:

# Input: nums1 = [1], m = 1, nums2 = [], n = 0
# Output: [1]
# Explanation: The arrays we are merging are [1] and [].
# The result of the merge is [1].
# Example 3:

# Input: nums1 = [0], m = 0, nums2 = [1], n = 1
# Output: [1]
# Explanation: The arrays we are merging are [] and [1].
# The result of the merge is [1].
# Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.
 

# Constraints:

# nums1.length == m + n
# nums2.length == n
# 0 <= m, n <= 200
# 1 <= m + n <= 200
# -109 <= nums1[i], nums2[j] <= 109

def merge(nums1, m, nums2, n)
    nums1 = nums1[0...m]
    nums2 = nums2[0...n]
    nums2.each do |num|
        nums1.insert(search_insert(nums1, num), num)
    end
    nums1
end

def search_insert(nums, target)
    start_pos = 0
    end_pos = nums.size-1
    while start_pos <= end_pos
        mid_pos = (start_pos + end_pos) / 2
        if nums[mid_pos] == target
            return mid_pos
        elsif nums[mid_pos] > target
            end_pos = mid_pos -1
        else
            start_pos = mid_pos + 1
        end
    end
    start_pos
end



print merge([1,2,3,0,0,0], 3, [2,5,6], 3)