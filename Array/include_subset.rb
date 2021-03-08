class Array
    def include_subset?(other)
        return false if Array.try_convert(self).nil?

        self.size.times do |i| 
            return true if other == self.slice(i, self.size)
        end

        false
    end    
end

p [].include_subset?([])           # false
p [2,3].include_subset?([2,3])     # true
p [1,2,3].include_subset?([2,3])   # true
p [1,2,3].include_subset?([2,3,3]) # false
p [1,2,3].include_subset?(2)       # false
