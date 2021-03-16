## PlayVapor

Vapor 놀이 공간

-   GET /

>Hello!

### 경로 지정

-   GET /hello

>   Hello, world!

-   GET /hello/vapor

>   Hello, Vapor!

### Request 파라미터

-   GET /hello/{name}

>   Hello, {name}!

### 지원 메서드

-   GET
-   POST
-   PATCH
-   PU
-   DELETE

### Path Component

-   Constant, (path): 정적 경로 요소
-   Paramter, (:path): 동적 경로 요소
-   Anything, (*): 단일 동적 경로 요소
-   Catchall, (**): 다중 동적 경로 요소

### Parameters

-   Parameter path component(:path)를 사용할 경우 파라미터의 값이 `request.paramters` 에 저장된다.

-   `get(_:as:)` 메서드를 사용하여 파라미터의 값을 형변환하여 사용할 수 있다.
-   `Catchall` 을 사용하면 request.parameters에 경로가 저장된다. request.parameters.getCatchall() 메서드를 사용

### Route Groups

-   `Path prefix` 를 사용하여 한 경로의 요청을 묶어서 처리할 수 있습니다.

### Redirections

-   `request.redirect(to:)` 메서드를 사용하여 사용자에게 리다이렉트를 할 수 있다.

---

## Fluent

>   Fluent는 Swift ORM 프레임워크입니다. Swift의 강력한 타입 시스템을 활용하여 데이터베이스에 접근하기 쉬운 인터페이스를 제공합니다. Fluent는 모델 타입의 데이터 구조를 나타냅니다. 이러한 모델은  로우 레벨의 쿼리를 작성하지 않고 생성, 읽기, 업데이트, 삭제 작업을 수행하는데 사용합니다.

Fluent framework 및 데이터베이스 설정

```swift
import Fluent
import FluentPostgresDriver

public func configure(_ app: Application) throws {
    app.databases.use(.postgres(
      	...
    ), as: .psql)
    ...
}
```

---

## PostgreSQL

### Install PostgreSQL

```bash
brew install postgresql
```

### Create a physical PostgreSQL database

```bash
initdb /usr/local/var/postgres
```

### Start a PostgreSQL database

```bash
pg_ctl -D /usr/local/var/postgres start
```

### Stop a PostgreSQL database

```swift
pg_ctl -D /usr/local/var/postgres stop
```

### Create the Actual PostgreSQL database

```bash
createdb mydatabase
```

### Remove the Actual PostgreSQL database

```bash
dropdb mydatabase
```

