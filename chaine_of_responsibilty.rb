# chaine of responsibiltyパターン

class Shop
    attr_accessor :payment_types
    def initialize(payment_types)
        @payment_types = payment_types
    end
end

class BaseHandler
    attr_accessor :successor
    def initialize(successor=nil)
        @successor = successor
    end

    def call(shop)
        return p "#{shop.payment_types}で支払う" if is_handle?(shop)
        
        @transition.call(shop)
    end

    def is_handle?(shop)
        raise NotImplementedError
    end
end

class CreditHandler < BaseHandler
    def call(shop)
        return p "#{shop.payment_types}で支払う" if is_handle?(shop)
        
        @successor.call(shop)
    end

    private 
    def is_handle?(shop)
        shop.payment_types.include?('credit')
    end
end

class TransportationIcHandler < BaseHandler
    def call(shop)
        return p "pasmoで支払う" if is_handle?(shop)
        
        @successor.call(shop)
    end

    private 
    def is_handle?(shop)
        shop.payment_types.include?('pasmo')
    end
end

class CashHandler < BaseHandler
    def call(shop)
        p "現金で支払う" 
    end
end

handler = TransportationIcHandler.new(CreditHandler.new(CashHandler.new))
shop = Shop.new(['cash', 'pasmo'])
handler.call(shop)

shop = Shop.new(['cash'])
handler.call(shop)
