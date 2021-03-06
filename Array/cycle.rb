class Array
    def cycle(*n, &proc)
        if n.empty?
            while 1 != 0
                self.each { |x| proc.yield(x)}
            end
        else
            n[0].times do |_|
                self.each { |x| proc.yield(x)}                
            end
        end
    end
end

[1, 3, 4].cycle(3) { |hoge| p hoge}
[1, 3, 4].cycle { |hoge| p hoge}
