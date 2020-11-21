# 二分探索
def binary_seach(arr, target)
    arr.sort!
    head = arr.size
    tail = 0

    while head != tail
        mid = (head + tail)/2
        if arr[mid] == target
            return mid
        elsif arr[mid] < target
            tail = mid + 1
        else
            head = mid - 1
        end
    end

    -1
end

arr = [1,3,4,5,7,8,9,11]
p binary_seach(arr, 14)
