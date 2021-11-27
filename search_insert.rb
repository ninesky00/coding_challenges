require 'pry'

# Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

# You must write an algorithm with O(log n) runtime complexity.

def search_insert(nums, target)
  start_pos = 0
  end_pos = nums.size-1
  while start_pos <= end_pos
      mid_pos = (start_pos + end_pos) / 2
      # binding.pry
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

puts search_insert([1,3,5,6], 5)
puts search_insert([1,3,5,6], 2)
# puts search_insert([1,3,5,6], 7)