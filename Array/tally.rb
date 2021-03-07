class Array
    def tally
        tmp = {}
        self.each do |a|
            if tmp[a].nil?
                tmp[a] = 1 
            else
                tmp[a] = tmp[a] + 1
            end
        end
        tmp
    end
end

p [1, 2, "huge", 1, nil, 1, nil].tally
# => {1=>3, 2=>1, "huge"=>1, nil=>2}
 