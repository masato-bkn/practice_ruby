# Proxyパターン

class Account
    attr_accessor :amount

    def initialize
        @amount = 0
    end

    def deposit(amount)
        @amount += amount
    end

    def withdrew(amount)
        @amount -= amount
    end

    def balance
        @amount
    end
end

class Proxy
    attr_accessor :creation_block

    def initialize(&creation_block)
        @creation_block = creation_block
    end

    def deposit(amount)
        subject.deposit(amount)
    end

    def withdrew(amount)
        subject.withdrew(amount)
    end

    def balance
        subject.balance
    end

    def subject
        @subject ||= @creation_block.call 
    end
end


proxy = Proxy.new{ Account.new }
proxy.deposit(100)
proxy.withdrew(40)
p proxy.balance