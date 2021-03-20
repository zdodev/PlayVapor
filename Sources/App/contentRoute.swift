import Fluent
import Vapor

func contentRoute(_ app: Application) throws {
    app.group("content") { content in
        /*
         POST /content/greeting HTTP/1.1
         
         {
             "hello": "world"
         }
         */
        content.post("greeting") { request -> String in
            let greeting = try request.content.decode(Greeting.self)
            return greeting.hello
        }
 
        /*
         GET /content/hello?name=Vapor?password=1234 HTTP/1.1
         content-length: 0
         */
        content.get("hello") { request -> String in
            var hello = try request.query.decode(Hello.self)
        
            if let value: String = request.query["name"] {
                print(value)
            }
            
            if let value: String = request.query["password"] {
                print(value)
            }
            
            try hello.beforeEncode()
            try hello.afterDecode()

            return "Hello, \(hello.name ?? "Anonymous")"
        }
    }
}

struct Greeting: Content {
    var hello: String
}

struct Hello: Content {
    var name: String?
}
