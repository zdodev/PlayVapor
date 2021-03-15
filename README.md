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