# 順列
def permutation(array, counter_part=[], result = [])
    if array.empty?
        result << counter_part
        return
    end

    array.each.with_index do |v, i|
        copy = array.dup
        copy.delete_at(i)

        permutation(copy, counter_part.dup << v, result)
    end

    return result
end

hoge = permutation([1, 2, 3])
p hoge
