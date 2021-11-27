require 'pry'
# Given, an array of size n. Find an element that divides the array into two sub-arrays with equal sums.
# Examples: 

# Input: 1 4 2 5
# Output: 2
# Explanation: If 2 is the partition, 
#       subarrays are : {1, 4} and {5}

# Input: 2 3 4 1 4 5
# Output: 1
# Explanation: If 1 is the partition, 
#  Subarrays are : {2, 3, 4} and {4, 5}

def balance_array(arr)
  # i, j = 0, arr.size - 1
  # left_sum = arr[i]
  # right_sum = arr[j]
  # while i < j
  #   # binding.pry
  #   if left_sum < right_sum 
  #     i += 1
  #     left_sum += arr[i]
  #   elsif left_sum > right_sum
  #     j -= 1
  #     right_sum += arr[j]
  #   else
  #     return arr[i+1]
  #   end
  # end
  sum = arr.inject(:+)
  leftsum = 0 
  i = 0 
  while i < arr.size
    if leftsum == (sum - leftsum - arr[i])
      return arr[i]
    end
    leftsum += arr[i]
    i += 1
  end
end

puts balance_array([1, 2, 3, 4, 6])