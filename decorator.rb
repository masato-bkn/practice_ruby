# decoratorパターン

class Varistor
    def self.pour(coffee)
        p "#{coffee.pour}なコーヒーを入れた" 
    end
end

class Coffee
    attr_accessor :type, :option

    def initialize(type, option=nil)
        @type = type
        @option = option
    end

    def pour
        @option.pour("#{@type}")
    end
end

class Suger
    attr_accessor :amount

    def initialize(amount, option=nil)
        @amount = amount
        @option = option
    end

    def pour(option)
        message = "#{option}->砂糖#{amount}個"

        return message if @option.nil?
        @option.pour(message)
    end
end

class Milk
    attr_accessor :amount

    def initialize(amount, option=nil)
        @amount = amount
        @option = option
    end

    def pour(option)
        message = "#{option}->ミルク#{amount}cc"

        return message if @option.nil?
        @option.pour(message)
    end
end

coffee = Coffee.new("ブラック", Suger.new(2, Milk.new(150)))
Varistor.pour(coffee)
