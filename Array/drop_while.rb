class Array
    def drop_wile(&block)
        self.each do |a|
            a.drop if block.yield
        end
    end
end

p [1, 3, 4, 5, 6, 8].drop_while { |a| a < 5 }
