def fibo(n)
    return @memo[n] if @memo.has_key?(n)
    if n == 1 || n == 2
        @memo[n] = 1
    else
        @memo[n] = fibo(n-2) + fibo(n-1)
    end
end

@memo = {}
p fibo(1)

# 1 1 2 3 5 8 13