require 'singleton'

class SingletonObject
    include Singleton
    attr_accessor :cnt

    def initialize
        @cnt = 0
    end
end

obj1 = SingletonObject.instance
obj1.cnt += 1
p obj1.cnt

obj2 = SingletonObject.instance
obj2.cnt += 1
p obj2.cnt

obj3 = SingletonObject.instance
obj3.cnt += 1
p obj3.cnt
