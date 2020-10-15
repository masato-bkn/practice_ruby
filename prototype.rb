# prototype

class Report
    attr_accessor :title, :author, :body

    def initialize(title, author, body)
        @title = title
        @author = author
        @body = body
    end
end

class Patent
    attr_accessor :title, :author, :body

    def initialize(title, author, body)
        @title = title
        @author = author
        @body = body
    end
end

class Store
    attr_accessor :documents 
    def initialize
        @documents = {}
    end

    def registor(document)
        id = @documents.size + 1
        @documents.store(id, document)

        id
    end

    def copy(id)
        @documents[id].clone
    end

    def delete(id)
        @documents.delete(id)
    end
end

store = Store.new
report = Report.new('hoge', 'huga', 'piyo')

id = store.registor(report)
report_copy = store.copy(id)

p report
p report_copy

report_copy.title = 'AAA'

# クローンの変更がオリジナルに影響を与えない
p report
p report_copy
