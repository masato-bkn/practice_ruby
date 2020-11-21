# バブルソート 
def bouble_sort(arr)
    tmp = 0
    (1..arr.size).each do |i|
        # 一回のソートで一番大きい数字が右端に行くので、ループのたびにみるインデックスを減らす
        (1..(arr.size - i)).each do |j|
            # x -> 内
            # j -> 外
            x = j - 1
            if arr[x] > arr[j]
                tmp = arr[x]
                arr[x] = arr[j]
                arr[j] = tmp
            end
        end
    end
    arr
end

arr = [1,3,2,9,8]
p bouble_sort(arr)
