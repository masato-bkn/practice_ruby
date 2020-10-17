# mediatorパターン
class Mediator
end

class Bank < Mediator
    def transfer(account, amount, to)
        account.amount -= amount
        to.amount += amount
        write_histroy(account, amount, to)
    end

    private

    def write_histroy(account, amount, to)
        account.history << "#{Time.now}: #{amount}円を#{to.name}に振り込みました。 残高: #{account.inquiry}"
        to.history << "#{Time.now}: #{account.name}から#{amount}円の入金がありました。残高: #{to.inquiry}"
    end
end

class Account
    attr_accessor :name, :amount, :bank, :history

    def initialize(name, amount=0, bank)
        @name = name
        @amount = amount
        @bank = bank
        @history = []
    end

    def transfer(to, amount)
        @bank.transfer(self, amount, to)
    end

    def inquiry
        @amount
    end

    def show_history
        p "◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇"
        @history.each {|record|p record}
        p "◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇"
    end
end

bank = Bank.new
hoge_acount = Account.new("hoge", 1000, bank)
fuga_acount = Account.new("fuga", 3000, bank)

hoge_acount.transfer(fuga_acount, 300)

[hoge_acount, fuga_acount].each { |account| account.show_history }
