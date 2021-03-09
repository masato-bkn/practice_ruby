class Array
    def combination(n)
        return [] if n > self.size
        return [] if n  == 0
        return [self] if n == self.size
        return self.map { |e| [e] } if n == 1

        result = []
        (0..self.size - n).each do |i|
            picked = self[i]
            left = self[i + 1..-1]
            left.combination(n - 1).each do |c|
                result << [picked] + c
            end
        end
        result
    end
end

p [1, 2, 3, 4].combination(2)
