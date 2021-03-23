import Fluent
import Vapor

enum Type: String, Codable {
    case todo
    case doing
    case done
}

final class Memo: Model, Content {
    static let schema = "memos"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String?
    
    @Field(key: "description")
    var description: String?
    
    @Field(key: "date")
    var date: String?
    
    @Field(key: "status")
    var status: String?
    
    @Enum(key: "type")
    var type: Type

    init() { }

    init(id: UUID, title: String, description: String, date: String, status: String, type: Type) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.date = date
        self.status = status
        self.type = type
    }
}
