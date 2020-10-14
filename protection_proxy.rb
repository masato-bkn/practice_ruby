# Proxyパターン

require 'etc'

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

class ProtectionProxy
    attr_accessor :subject, :owner_name

    def initialize(real_account, owner_name)
        @subject = real_account
        @owner_name =owner_name
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

    def check_access
        if Etc.getlogin != @owner_name
            raise "#{Etc.getlogin} cannot access account."
        end
    end
end

account_proxy = ProtectionProxy.new(Account.new, "XXX")
account_proxy.deposit(100)
account_proxy.withdrew(10)
p account_proxy.balance
