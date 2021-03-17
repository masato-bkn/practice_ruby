class String
    def ljust(width, padding = ' ')
        raise TypeError if width.nil? or padding.nil?
        return self if self.length > width

        result = self

        while result.length <= width
            result += padding
        end

        remove_len = result.length - width
        result[0, result.length - remove_len]
    end
end

p 'hoge'.ljust(10, '#') # => "hoge######"
p 'hoge'.ljust(11, 'ABC') # => "hogeABCABCA"
p 'hoge'.ljust(10) # => "hoge      "
p 'hoge'.ljust(10, nil) # => TypeError
p 'hoge'.ljust(nil, 10) # => TypeError
