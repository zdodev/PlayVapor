import Fluent
import Vapor

func routes(_ app: Application) throws {
//    app.get { req in
//        return req.view.render("index", ["title": "Hello Vapor!"])
//    }
    app.get { request -> String in
        return "Hello!"
    }

    app.get("hello") { request -> String in
        "Hello, world!"
    }
    
    app.get("hello", "vapor") { request in
        "Hello, Vapor!"
    }
    
    app.get(["hello", "zdo"]) { request in
        "Hello, zdo!"
    }
    
    app.on(.GET, "hello", "ios") { request in
        "Hello, iOS!"
    }
    
    app.get("hello", ":name") { request -> String in
        let name = request.parameters.get("name")!
        return "Hello, \(name)!"
    }
    
    app.get("number", ":x") { request -> String in
        guard let int = request.parameters.get("x", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "\(int) is a great number."
    }
    
    app.get("hello", "**") { request -> String in
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
    
    app.group("users") { users in
        users.get { request in
            "GET users"
        }
        users.post { request in
            "POST users"
        }
        users.group(":id") { user in
            user.get { request in
                "GET users \(request.parameters.get("id")!)"
            }
            user.post { request in
                "POST users \(request.parameters.get("id")!)"
            }
            user.patch { request in
                "PATCH users \(request.parameters.get("id")!)"
            }
            user.put { request in
                "PUT users \(request.parameters.get("id")!)"
            }
            user.delete { request in
//                "DELETE users \(request.parameters.get("id")!)"
                request.redirect(to: "https://www.naver.com")
            }
        }
    }

    try app.register(collection: TodoController())
}
