require 'benchmark'

class Array
    # バブルソート
    # O(n^2)
    def bouble_sort
        len = self.size
        (0...len).each do |i|
            (i+1...len).each do |j|
                if self[j] < self[i]
                   tmp =  self[i]
                   self[i] = self[j]
                   self[j] = tmp
                end
            end            
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
            j = i - 1
            # target = self[i]

            while j >= 0
                if self[i] < self[j]
                    self[j], self[i] = self[i], self[j]
                end
                j -= 1
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
        h = len/2

        while 0 < h
            (0...len).each do |i|
                j = i - h
        
                while j >= 0
                    if self[i] < self[j]
                        self[j], self[i] = self[i], self[j]
                    end
                    j -= h
                    i -= h
                end
            end
            h = h/2
        end
        self
    end
end

a = [34, 6, 99, 43, 67, 37, 100, 87, 5, 25, 85, 19, 63, 9, 1, 35]
p a.dup.bouble_sort
p a.dup.selection_sort
p a.dup.insert_sort
p a.dup.quit_sort
p a.dup.shell_sort