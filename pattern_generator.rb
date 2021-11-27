require 'pry'

# pg = PatternGenerator.new
# pattern = ".#."
# pg.verify("A3B", pattern)
# # => true
# pg.verify("AAB", pattern)
# # => false

def verify(input, pattern)
    input.each_char.with_index do |char, index|
        if /[A-Z]/.match(char)
            input[index] = "."
        elsif /[0-9]/.match(char)
            input[index] = "#"
        else
            return false
        end
    end
    input == pattern
end

def generate(num, pattern)
    pattern.each_char.with_index do |char, index|
        if char == "."
            pattern[index] = "A"
        elsif char == "#"
            pattern[index] = "0"
        else
            return "incorrect input"
        end
    end
    first_digit = num / 260
    second_digit = num / 26
    last_digit = num % 26
    first = (pattern[0].ord + first_digit).chr
    second = (pattern[1].ord + second_digit).chr
    last = (pattern[2].ord + last_digit).chr
    first+second+last
end

pattern = ".#."
# puts verify("A3B", pattern)
# puts verify("AAB", pattern)
# puts generate(0, pattern) #"AOA"
puts generate(27, pattern) #"A1B"