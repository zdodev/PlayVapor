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

    try app.register(collection: TodoController())
}
