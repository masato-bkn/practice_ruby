# エンドレス定義構文
def endless(hoge) =
    puts(hoge)
    # pが使えない、カッコを付けないといけない、とういう制約がある
    # 他にも何か制約がありそうだ
endless('--v--')

# 右代入
'=>>>>>' => fuga
p fuga

(1..10).map(&:to_i) => x 
p x.first(5)
