# frozen_string_literal: true

class Hash
    def pop
        delete(keys.last)

        self
    end
end

hash = {:hoge => 1, :huga => 2}
hash.pop

p hash
