"""""配列、繰り返し、組み込みメソッド"""""

# select
nums = [1,2,3,4,5]
p nums.select{ |n| n.even?} #下に書き換え可能
p nums.select(&:even?) 

# 範囲
a = 1..5
p a.include?(3)

b = [1,2,3,4,5]
p b.include?(3)

# steo
nums = []
(1..10).step(2) {|n| nums << n} # 配列の最後に追加
p nums

# 要素の変更
a = [1,2,3]
a[-3] = -10
p a

a = []
a.push(2,3)
p a

e,*f = 100,200,300
p *f # 可変長

p "Ruby".chars

fruits = ["apple","orange","melon"]
p fruits.map.with_index {|fruit,i| "#{i}: #{fruit}"}

a = []
1.step(10,2){|n|a<<n}
p a

"""""ハッシュ"""""
a ={"japan"=>"yen","us"=>"dollar","india"=>"rupee"}
a ={japan:"yen",us:"dollar",india:"rupee"}
p a["japan"] # 取ってこれないのね。。
p a[:japan]

symbol = "apple" # ミュータブル
symbol = :apple  # イミュータブル

# キーも値もシンボル
# a ={japan::yen,us::dollar,india::rupee}
# p a[:japan]

limit = nil
limit ||= 10 # limitがnilだったら代入する
p limit

# !! -> trueかfalseを返す。
p !!true
p !!1

"""クラス"""

class User
    attr_accessor :name, :age
    # 読み取り専用
    # attr_reader :name

    # 初期化
    def initialize(name)
        @name = name
    end

    def hello
        p "Hello, I am #{@name}"
    end

    # # ゲッター
    # def name
    #     @name
    # end

    # def name=value
    #     @name=value
    # end

    # クラスメソッド
    def self.create_user(names)
        names.map do |name|
            User.new(name)
        end
    end

end

user1 = User.new("masato-bkn")

p user1.hello
p user1.name
p user1.name = "masatoZ"

names = ["Alice","Bob","CC"]
users = User.create_user(names)
users.each do |user|
    puts user.hello
end

user1 = User.new("masato-bkn")
p user1.instance_of?(User)


# 継承
class Product
    PRICE = 0
end

class DVD < Product
end

# privateメソッド -> レシーバーを指定してメソッドを呼び出すことができない。
# クラスメソッドはprivateの下に書いてもprivateにならない
# protectedメソッド -> 自分んと同じクラス、そのサブクラスからは呼び出し可能。

## クラスの外部から定数を参照する場合
p DVD::PRICE

# equal -> 全く同じジュジェクトかどうか判定する
