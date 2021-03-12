# テンプレートパターン

class Robot
    attr_accessor :name 

    def initialize(name)
        @name = name 
    end

    def start_up
        raise NotImplementedError
    end
end

class Gundam < Robot
    attr_accessor :pairot

    def initialize(name, pairot)
        super(name)
        @pairot = pairot
    end

    def start_up
        p "######################"
        p "#{@name} is start_up"
        p pick_up
        p depart
        p "######################"
    end

    private

    def pick_up
        "pick_up #{@pairot}"
    end

    def depart
        "depart"
    end
end

class Transformer < Robot
    attr_accessor :to

    def initialize(name, to)
        super(name)
        @to = to
    end

    def start_up
        p "######################"
        p "#{@name} is start_up"
        p transform
        p "######################"
    end

    private

    def transform
        "transform to #{@to}"
    end
end

robots = [] 
robots << Gundam.new("初期の白いやつ", "打たれたことないあいつ")
robots << Transformer.new("コンボイ", "トラック")

for robot in robots
    robot.start_up
end
