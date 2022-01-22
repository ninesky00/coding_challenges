# 169. Majority Element
# Given an array nums of size n, return the majority element.

# The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

 

# Example 1:

# Input: nums = [3,2,3]
# Output: 3
# Example 2:

# Input: nums = [2,2,1,1,1,2,2]
# Output: 2
 

# Constraints:

# n == nums.length
# 1 <= n <= 5 * 104
# -231 <= nums[i] <= 231 - 1
 

# Follow-up: Could you solve the problem in linear time and in O(1) space?

# def majority_element(nums)
#   #standard hash map solution
#   map = Hash.new(0)
#   nums.each do |num|
#     map[num] += 1
#   end
#   map.max_by {|k, v| v}[0]
# end

def majority_element(nums)
  # attempting to answer the follow-up for O(1) space complexity
  # was not able to come up with the solution myself, had to look it up.
  sol, count = 0, 0
  for n in nums
    if count == 0 
      sol = n
    end
    count += n == sol ? 1 : -1
  end
  sol
end

puts majority_element([3,2,3]) #3
puts majority_element([2,2,1,1,1,2,2]) #2