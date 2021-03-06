class Array
    def zip(*n)
        raise ArgumentError if n.any? {|i| i.class != Array }

        ziped = Array.new(self.size).map {|a| a = []}

        ziped.each_with_index do |a, i|
            a << self[i]
        end

        n.each do |b|
            self.count.times do |j|
                ziped[j] << b[j]
            end
        end
        ziped
    end
end

p [1, 2, 3].zip(['a', 'b', 'c'], [5, 6])
