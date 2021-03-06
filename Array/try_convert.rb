class Array
    def try_convert(n)
        return n if n.class == Array
        nil
    end
end

p Array.try_convert([1]) # => [1]
p Array.try_convert(1) # => nil
