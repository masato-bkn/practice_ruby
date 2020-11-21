def quit_sort(arr)
    return arr if arr.size == 1

    pivot = arr[0]
    right = []
    left = []

    (1..arr.size-1).each do |i|
        if arr[i] < pivot
            right << arr[i] 
        else
            left << arr[i]
        end
    end
    quit_sort(right) + [pivot] + quit_sort(left)
end

arr = [6,2,11,1,10,4,15,5,3]
p quit_sort(arr)
