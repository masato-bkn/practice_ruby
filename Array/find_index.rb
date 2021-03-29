class Array
    def find_index(target)
        self.each_with_index do |element, index|
            return index if element == target
        end
        -1
    end
end

p [nil,1,"hoge"].find_index("hoge") # => 2
p [nil,1,"hoge"].find_index("hogehoge") # => -1
p [].find_index("hogehoge") # => -1
