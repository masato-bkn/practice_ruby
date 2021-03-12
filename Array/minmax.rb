class Array
    def minmax
        return [nil, nil] if empty? 
        return [first, first] if one? 

        min, max = first, first

        self.each do |num|
            min = num if num < min
            max = num if num > max
        end

        [min, max]
    end
end

p [].minmax # => [nil, nil]
p [1].minmax # => [1, 1]
p [1, 2, 3].minmax # => [1, 3]
p [3, 2, 1, 5].minmax # => [1, 5]
