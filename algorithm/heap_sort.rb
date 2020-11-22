# ヒープソート
def heap_sort(arr)
    # 末葉より上がヒープな状態
    build_heap(arr)

    # 末尾を
    (arr.size - 1).downto(1) do |i|
        arr[0], arr[i] = arr[i], arr[0]
        heapify(arr, 0, i)
    end
    arr
end

# 任意の配列からヒープを作成する
def build_heap(arr)
    # n/2+1以降のノードはすべて葉ノードになるので、heapifyを適用する必要がない
    n = arr.size/2 + 1
    n.downto(0) do |i|
        heapify(arr, i, arr.size)
    end
end

# あるノードとその配下のノードがヒープ条件を満たすように操作
def heapify(list, i, max)
    largest = i
    left  = i*2 + 1
    right = i*2 + 2

    # left < max -> 末葉は比較させない
    largest = left if (left < max) && (list[left] > list[largest])
    largest = right if (right < max) && (list[right] > list[largest])

    # 最大値の交換が発生する場合(= ヒープの条件を満たさない場合)、交換してソートする
    if largest != i
        list[i], list[largest] = list[largest], list[i]
        heapify(list, largest, max)
    end
end

p heap_sort([34, 6, 99, 43, 67, 37, 100, 87, 5, 25, 85, 19, 63, 9, 35])
