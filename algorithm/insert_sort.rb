# 挿入ソート
def insert_sort(arr)
    len = arr.length

    (1...len).each do |i|
        j = i - 1
        tmp = arr[i]

        p "===#{i}回目==="

        while j >= 0
            if tmp < arr[j]
                arr[j], arr[j+1] = arr[j+1], arr[j]
            end
            j -= 1
            p arr
        end
    end
    arr
end

arr = [1,5,8,3,6]
p insert_sort(arr)
