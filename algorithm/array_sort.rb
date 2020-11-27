require 'benchmark'

class Array
    # バブルソート
    # O(n^2)
    def bouble_sort
        len = self.size
        (0...len).each do |i|
            swapped = false

            (i+1...len).each do |j|
                if self[j] < self[i]
                   tmp =  self[i]
                   self[i] = self[j]
                   self[j] = tmp
                   swapped = true
                end
            end    

            break if !swapped
        end
        self
    end

    # 選択ソート
    # O(n^2)
    def selection_sort
        len = self.size

        (0...len).each do |i|
            # 毎回先頭の要素を最小値のインデックスに設定
            min_i = i
            (i+1...len).each do |j|
                if self[j] < self[min_i] 
                    min_i = j
                end
            end
            tmp = self[i]
            self[i] = self[min_i]
            self[min_i] = tmp
        end
        self
    end

    # 挿入ソート
    # O(n^2)
    def insert_sort
        len = self.size

        (1...len).each do |i|
            while i-1 >= 0
                if self[i] < self[i-1]
                    self[i-1], self[i] = self[i], self[i-1]
                end
                i -= 1
            end
        end
        self
    end

    # クイックソート
    # O(log2n)
    def quit_sort
        return self if self.size <= 1 

        pivot = self[0]
        left = []
        right = [] 

        (1...self.size).each do |i|
            if pivot < self[i]
                right << self[i]
            else
                left << self[i]
            end            
        end

        left.quit_sort + [pivot] + right.quit_sort
    end

    # シェルソート
    # O(log2n)
    def shell_sort
        len = self.size

        h = 1
        while h < len/9 
            h = h*3 + 1
        end

        while h > 0
            (h...len).each do |i|
                j = i
                while j >= h and self[j-h] > self[j]
                    self[j-h], self[j] = self[j], self[j-h]
                    j -= h
                end
            end
            h = h/3
        end
        self
    end

    def merge_sort
        len = self.size

        return self if len <= 1

        mid = len/2
        left = self.take(mid)
        right = self.drop(mid)

        # p "#######"
        # p left, right
        # p "#######"


        sorted_left = left.merge_sort
        sorted_right = right.merge_sort

        # p "#######"
        # p sorted_left, sorted_right
        # p "#######"

        merge(sorted_left, sorted_right)
    end

    private

    def merge(left_ary, right_ary)
        if right_ary.empty?
            return left_ary
          end
      
          if left_ary.empty?
            return right_ary
          end

        smallest = if left_ary.first < right_ary.first
            left_ary.shift
        else
            right_ary.shift
        end

        recursive = merge(left_ary, right_ary)

        [smallest].concat(recursive)
    end
end

a = [34, 6, 99, 43, 67, 37, 100, 87, 5, 25, 85, 19, 63, 9, 1, 35]
p a.dup.bouble_sort
p a.dup.selection_sort
p a.dup.insert_sort
p a.dup.quit_sort
p a.dup.shell_sort
p a.dup.merge_sort

Benchmark.bm 10 do |r|
    a = [*1..1000].shuffle
    r.report "bouble_sort" do
        a.dup.bouble_sort
    end
  
    r.report "selection_sort" do
        a.dup.selection_sort
    end

    r.report "insert_sort" do
        a.dup.insert_sort
    end

    r.report "quit_sort" do
        a.dup.quit_sort
    end

    r.report "shell_sort" do
        a.dup.shell_sort
    end

    r.report "merge_sort" do
        a.dup.merge_sort
    end
end
