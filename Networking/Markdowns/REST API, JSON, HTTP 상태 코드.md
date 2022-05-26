## REST API, JSON, HTTP 상태 코드

### 1. REST API

- Representational State Transfer


- 자원을 이름으로 구분해 자원의 정보를 주고 받는 방식


- HTTP를 기반으로 자원에 접근하는 방식을 정해 놓은 아키텍처이자 규칙 모음


- 3요소로 구성됨


    1. 자원


        - URI를 통해 접근
            - URL ⇒ 자원의 위치를 나타내는 주소


    2. 행위


        - GET, PUT, POST, DELETE


    3. 메시지


        - 표현 방식
            - JSON 형식을 사용


### 2. JSON

- JavaScript Object Notation


- XML보다 가벼운 데이터 교환 형식


- 주고 받을 수 있는 자료형 ⇒ Int, String, Boolean, Array, Object


- Key-Value로 구성되며, 객체는 중괄호 `{}`, 배열은 대괄호 `[]`로 표현됨

### 3. HTTP 상태 코드

- REST API 규칙에 맞게 (자원, 행위, 메시지) 리소스에 대한 접근을 서버에 요청하면 응답이 돌아옴


- 응답 ` Response` = 상태 코드 `Status Code` + 메시지 `Message` + 데이터 `Body`


- 상태 코드

    i. 2XX ⇒ 성공적인 요청


        - 200
            - OK
            - 요청 성공
            
        - 201
            - Created
            - 요청이 성공되고, 새로운 리소스가 생성됨
            - POST, PUT 이후에 응답
            
        - 202
            - Accepted
            - 요청이 접수되었고, 아직 미처리 상태임
            
    ii. 4XX ⇒ 클라이언트의 잘못된 요청


        - 400
            - Bad Request
            - 클라이언트의 요청이 유효하지 않음
            
        - 401
            - Unauthorized
            - 클라이언트가 권한을 가지고 있지 않음 → 작업을 진행하지 못하는 상태
            
        - 404
            - Not Found
            - 존재하지 않는 페이지를 요구 → 서버가 요청한 페이지 (= Resource) 를 찾지 못함
            
        - 405
            - Method Not Allowed
            - 허용되지 않은 메서드를 요구함

    iii. 5XX ⇒ 서버 오류
    

        - 500
            - Internal Server Error
            - 서버에 오류 발생 → 요청을 수행할 수 없음
            
        - 501
            - Not Implemented
            - 서버에 해당 요청을 수행할 수 있는 기능이 없음
            - 요청 메서드를 인식 못하는 경우
            
        - 503
            - Service Unavailable
            - 서버 과부화, 유저 관리를 위한 다운 등으로 인해 일시적으로 서버를 이용할 수 없는 경우
