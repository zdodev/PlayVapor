import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { request -> String in
        return "Hello!"
    }

    app.get("route") { request -> String in
        "Hello, world!"
    }
    
    app.get("route", "1") { request in
        "Hello, 1"
    }
    
    app.get(["route", "2"]) { request in
        "Hello, 2"
    }
    
    app.on(.GET, "route", "3") { request in
        "Hello, 3"
    }
    
    app.get("route", ":name") { request -> String in
        let name = request.parameters.get("name")!
        return "Hello, \(name)!"
    }
    
    app.get("number", ":x") { request -> String in
        guard let int = request.parameters.get("x", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "\(int) is a great number."
    }
    
    app.get("route", "**") { request -> String in
        let name = request.parameters.getCatchall().joined(separator: " ")
        return "Hello, \(name)!"
    }
    
//    let users = app.grouped("users")
//    users.get { request in
//        "user information"
//    }
//    users.post { request in
//        "user regist"
//    }
//    users.get(":id") { request -> String in
//        let id = request.parameters.get("id")!
//        return id
//    }
    
    app.group("group") { users in
        users.get { request in
            "GET group"
        }
        users.post { request in
            "POST group"
        }
        users.group(":id") { user in
            user.get { request in
                "GET group \(request.parameters.get("id")!)"
            }
            user.post { request in
                "POST group \(request.parameters.get("id")!)"
            }
            user.patch { request in
                "PATCH group \(request.parameters.get("id")!)"
            }
            user.put { request in
                "PUT group \(request.parameters.get("id")!)"
            }
            user.delete { request in
//                "DELETE users \(request.parameters.get("id")!)"
                request.redirect(to: "https://www.naver.com")
            }
        }
    }

    try app.register(collection: TodoController())
}
