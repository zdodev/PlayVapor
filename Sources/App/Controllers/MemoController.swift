import Fluent
import Vapor

struct MemoController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let memos = routes.grouped("memos")
        memos.get(use: readAllMemo)
        
        let memo = routes.grouped("memo")
        memo.post(use: createMemo)
        memo.patch(use: updateMemo)
        memo.delete(":index", use: deleteMemo)
    }

    func readAllMemo(request: Request) throws -> EventLoopFuture<[Memo]> {
        return Memo.query(on: request.db).all()
    }

    func createMemo(request: Request) throws -> EventLoopFuture<Memo> {
        let memo = try request.content.decode(Memo.self)
        return memo.save(on: request.db).map {
            memo
        }
    }
    
    func updateMemo(request: Request) throws -> EventLoopFuture<[Memo]> {
        let memo = try request.content.decode(Memo.self)
        
        guard let index = memo.id else {
            throw Abort(.badRequest)
        }
        
        if let title = memo.title {
            _ = Memo.query(on: request.db)
                .set(\.$title, to: title)
                .filter(\.$id == index)
                .update()
        }

        if let description = memo.description {
            _ = Memo.query(on: request.db)
                .set(\.$description, to: description)
                .filter(\.$id == index)
                .update()
        }

        if let date = memo.date {
            _ = Memo.query(on: request.db)
                .set(\.$date, to: date)
                .filter(\.$id == index)
                .update()
        }
        
        if let status = memo.status {
            _ = Memo.query(on: request.db)
                .set(\.$status, to: status)
                .filter(\.$id == index)
                .update()
        }
        
        return Memo.query(on: request.db).all()
    }

    func deleteMemo(request: Request) throws -> EventLoopFuture<Memo> {
        let memo = Memo.find(request.parameters.get("index"), on: request.db)
            .unwrap(or: Abort(.notFound))
        
        _ = Memo.find(request.parameters.get("index"), on: request.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.delete(on: request.db)
            }
        
        return memo
    }
}
