
class Array
    def max_by(key)
        # 指定したkeyに置いて一番大きいvalueを持つ要素を返す

        max_index = 0
        max = 0

        self.each_with_index do |object, i|
            max = object[key] if i == 0

            if object[key] > max
                max = object[key]
                max_index = i
            end
        end

        self[max_index]
    end
end

hoge = [
    {"name" => "apple", "price" => 80},
    {"name" => "banana", "price" => 100},
    {"name" => "orange", "price" => 60}
]

p hoge.max_by("name")
