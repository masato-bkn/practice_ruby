class String
    def chars
        result = []

        self.size.times do |i|
            result << self[i]
        end

        result
    end
end

p 'hoge'.chars # => ['h', 'o', 'g', 'e']
p ''.chars # => []
