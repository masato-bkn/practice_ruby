# zip関数を自前で作成
def zip(*array)
    return array if array.size == 1

    max_el_size = array.max {|a, b| a.size <=> b.size}.size
    result = Array.new(max_el_size, [].dup).map {|e| e.dup }

    array.size.times { |i|
        max_el_size.times { |j|
           result[j] << array[i][j]
        } 
    }

    return result
end

p zip([1,2,3])
p zip([1,2,3],[:a,:b])
