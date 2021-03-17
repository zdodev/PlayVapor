import Vapor

func validationData(_ app: Application) throws {
    app.group("validation") { validation in
        validation.post("users") { request-> CreateUser in
            try CreateUser.validate(content: request)
            let user = try request.content.decode(CreateUser.self)
            return user
        }
    }
}

enum Color: String, Codable {
    case red, blue, green
}

struct CreateUser: Content {
    var name: String
    var username: String
    var age: Int
    var email: String
    var favoriteColor: Color?
}

extension CreateUser: Validatable {
    static func validations(_ validations: inout Validations) {
        validations.add("email", as: String.self, is: .email)
    }
}
