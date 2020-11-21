# 選択ソート
# def selection_sort(arr)
#     i = 0
#     while i < (arr.size - 1)
#         min_i = i
#         k = i + 1
#         while k < arr.size
#             if arr[k] < arr[i]
#                 min_i = k
#             end
#             k += 1
#         end
#         tmp = arr[i]
#         arr[i] = arr[min_i]
#         arr[min_i] = tmp
#         i += 1
#     end
#     arr
# end

def selection_sort(arr)
    (0...arr.size).each do |i|
        # 先頭の要素を最小に設定
        min = arr[i]
        min_i = i

        # 最小値を選択
        (i+1...arr.size).each do |j|
            if arr[j] < min
                min = arr[j]
                min_i = j
            end
        end

        # 入れ替え
        tmp = arr[i]
        arr[i] = arr[min_i] 
        arr[min_i] = tmp    
    end
    arr
end

arr = [1,10,5,6]
p selection_sort(arr)
