# mementoパターン
class Memento
    attr_accessor :history

    def initialize
        @history = {}
    end

    def snapshot(pokemon)
        @history[pokemon.level] = Marshal.load(Marshal.dump(pokemon))
    end

    def undo(level)
        @history[level].clone
    end
end

class Pokemon
    attr_accessor :level, :waza, :name, :waza_repository
    
    def initialize(name)
        @level = 1
        @name = name
        @waza = []
    end

    def level_up
        @level += 1
        acquire
    end

    private

    def acquire
        if waza = waza_repository.waza[@level]
            @waza << waza
        end
    end
end

class Waza
    attr_accessor :owner, :waza

    def initialize(owner)
        @owner = owner
        @waza = {}
    end

    def regist(level, waza)
        @waza.store(level, waza)
    end
end


a = Pokemon.new("hoge")

waza = Waza.new(a.name)
waza.regist(2, "なきごえ")
waza.regist(3, "体当たり")
waza.regist(4, "いあいぎり")
waza.regist(5, "かたくなる")

a.waza_repository = waza

memento = Memento.new
4.times do |_|
    a.level_up
    memento.snapshot(a)    
end

p a.waza
a = memento.undo(2)
p a.waza
