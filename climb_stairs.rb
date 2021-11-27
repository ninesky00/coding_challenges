require 'pry'
# You are climbing a staircase. It takes n steps to reach the top.

# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
def climb_stairs(n)
    return n if n < 3
    fb = [0, 1, 2]
    3.upto(n) do |x|
        fb[x] = fb[x-1] + fb[x-2]
    end
    fb.last
end



puts climb_stairs(2)
# puts climb_stairs(3)