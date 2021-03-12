# テンプレートパターン

class Robot
    attr_accessor :name, :life, :power, :weapon

    def initialize(name:, life:, power:, weapon:)
        @name = name
        @life = life
        @power = power
        @weapon = factory(weapon)
    end

    def attack(other)
        other.life -= overrall_power
        p "#{@name}が#{other.name}に#{overrall_power} damage"

        return p "#{@name} win"if other.life <= 0

        p "#{@name}の残りlife: #{other.life}"
    end

    private

    def factory(weapon)
        case weapon
        when 'Drill'
            Drill.new
        when 'Sord'
            Sord.new
        when 'Rocket' then
            Rocket.new
        else
            nil
        end
    end

    def overrall_power
        @power + @weapon&.power
    end
end

class Weapon
    attr_accessor :power
    
    def initialize(power)
        @power = power
    end
end

class Rocket < Weapon
    def initialize
        super(100)
    end
end

class Drill < Weapon
    def initialize
        super(50)
    end
end

class Sord < Weapon

    def initialize
        super(70)
    end
end

robotA= Robot.new(name: "A", life: 300, power: 100, weapon: "Sord")
robotB= Robot.new(name: "B", life: 280, power: 70, weapon: "Rocket")

p "####"
p "#{robotA.name}のlife: #{robotA.life}"
p "#{robotB.name}のlife: #{robotB.life}"
p "####"

robotA.attack(robotB)
robotB.attack(robotA)
robotA.attack(robotB)