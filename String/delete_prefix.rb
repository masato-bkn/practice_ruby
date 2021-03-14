class String
    def delete_prefix(str)
        cnt = self.size
        rec = 0

        cnt.times.each do |i|
             rec = i if str[0..i] == self[0..i]
        end

        rec += 1if rec != 0
        self[rec..]
    end
end

p 'hoge'.delete_prefix('ho') # => ge
p 'hoge'.delete_prefix('ho') # => ge
p 'hoge'.delete_prefix('ddd') # => hoge
