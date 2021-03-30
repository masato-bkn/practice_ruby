class Hash
    def dig(*targets)
        tmp = self
        targets.each do |target|
            if tmp.key?(target)
                tmp = tmp[target] 
            else
                return nil
            end
        end
        return tmp
    end
end

hash = {
    "hoge" => {
        "huga" => {
            "foo" => 123
        }
    }
}

p hash.dig("hoge", "huga", "foo") # => 123
p hash.dig("hoge", "huga", "fooooo") # => nil

hash = {
    "hoge" => [1, 2, 3]
}
