
class Company
    attr_accessor :name, :children, :parent

    def initialize(name:, children:, parent:)
        @name = name
        @children = children
        @parent = parent
    end
end
