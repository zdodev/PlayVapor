import Vapor

func clientRequest(_ app: Application) throws {
    app.get("client") { request -> String in
        let requestResult = request.client.get("http://zdo.herokuapp.com").map { response in
            print(response)
        }
        return "ok"
    }
}
