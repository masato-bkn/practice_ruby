# visitorパターン

class AccepterA
    def self.accept(visitor)
        visitor.do_something(self)
    end
end

class AccepterB
    def self.accept(visitor)
        visitor.do_something(self)
    end
end

class Visitor
    attr_accessor :behavir
    def do_something(accepter)
        if accepter == AccepterA
            do_something_a
        else
            do_something_b
        end
    end

    def do_something_a
        p 'do_something_a'
    end

    def do_something_b
        p 'do_something_b'
    end
end

AccepterA.accept(Visitor.new)
AccepterB.accept(Visitor.new)
