# 選択ソート
def selection_sort(arr)
    (0...arr.size).each do |i|
        min = arr[i]
        min_i = i
        (i+1...arr.size).each do |j|
            if arr[j] < min
                min = arr[j]
                min_i = j
            end
        end
        tmp = arr[i]
        arr[i] = arr[min_i] 
        arr[min_i] = tmp    
    end
    arr
end

arr = [1,10,5,6]
p selection_sort(arr)
