import Fluent
import Vapor

final class Memo: Model, Content {
    static let schema = "memos"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String
    
    @Field(key: "description")
    var description: String
    
    @Field(key: "date")
    var date: String
    
    @Field(key: "status")
    var status: String

    init() { }

    init(id: UUID, title: String, description: String, date: String, status: String) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
        self.status = status
    }
}
