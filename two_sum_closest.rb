require 'pry'

#helper method for two_sum_closest, but might have application

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
    [left, right]
end



puts two_sum_closest([2, 7, 11, 15, 23, 31], 10)