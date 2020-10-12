# observerパターン

module Observer
    def add_observer(observer)
        @observer << observer
        @observer.flatten
    end

    def notify(person)
        @observer.each do |observer|
            case person.type
            when 'driver' then
                DeliveryObserver.notify(object)
            when 'suspicious_person' then
                SuspiciousPersonObserver.notify(object)
            end
        end
    end
end

class SuspiciousPersonObserver
    def self.notify(person)
        p "#{person.name}が来た"
    end
end

class DeliveryObserver
    def self.notify(person)
        p "#{person.name}が来た"
    end
end

class House
    include Observer

    attr_accessor :observer, :visitor

    def initialize
        @observer = []

    end

    def visitor=(person)
        @visitor=person
        notify(person)
    end
end

class Person
    attr_accessor :name, :type

    def initialize(name, type)
        @name = name
        @type = type
    end
end


house = House.new
house.add_observer([SuspiciousPersonObserver.new, DeliveryObserver.new])
house.visitor= Person.new('sagawa','driver')
