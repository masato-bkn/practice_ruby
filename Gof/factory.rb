class Robot
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def start_up
        raise NotImplementedError
    end
end

class Eva < Robot
    def start_up
        p '#######'
        p "Eva: #{name}"
        p '#######'
    end
end

class Transformer < Robot
    attr_accessor :to

    def initialize(name, to)
        @to = to
        super(name)
    end

    def start_up
        p '#######'
        p "Transformer: #{name}"
        p "trnsform to #{to}"
        p '#######'
    end
end

class Gomdam < Robot
    attr_accessor :pairot

    def initialize(pairot)
        @pairot = pairot
        super(name)
    end

    def start_up
        p '#######'
        p "Transformer: #{name}"
        p "parot: #{pairot}"
        p '#######'
    end
end

def factory(type:, name:, to: nil, pairot: nil)
    case type
    when 'Eva' then Eva.new(name)
    when 'Transformer' then Transformer.new(name, to)
    when 'Gomdam' then Transformer.new(name, pairot)
    end
end

factory(type: Eva.to_s, name: '初号機').start_up
factory(type: Transformer.to_s, name: 'スタースクリーム', to: '戦闘機').start_up
factory(type: Gomdam.to_s, name: "初期の白いやつ", pairot: "打たれたことないあいつ").start_up
