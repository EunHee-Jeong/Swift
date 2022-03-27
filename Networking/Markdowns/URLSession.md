## URLSession

### 1. URLSession

- 애플이 **HTTP 통신을 위해 만든 API**


- 특정한 `url` 을 이용해 **데이터를 다운로드**하고 **업로드**하기 위한 API이다.


- 즉 iOS App에서 서버와 통신하기 위해 제공되는 API이다.


- iOS App에서는 하나 이상의 URLSession 인스턴스를 생성하여 관련 데이터 전송 작업 그룹을 조정한다.


    - ex - 웹 브라우저 만들기


        - 창 당 하나의 **Session을 만들고**, 각 **Session 내에서 특정 url에 대한 요청을 나타내는 일련의 작업을 추가**


- HTTP API이기 때문에, `Request` 와 `Response` 의 기본 구조를 가진다.


    - Request
        - 서버로 요청을 보낼 때 어떤 HTTP Method를 사용할 것인지, 캐싱 정책은 어떻게 할 것인지 등을 **설정**하는 것

    - Response
        - **url 요청의 응답**을 나타내는 객체

### 2. URLSession을 이용한 서버통신 과정

- **URLSession을 생성**하고 → **URLSessionTask를 생성**한 후 → 실제 **서버와 통신**한다.


- `URLSessionConfiguration`
    - configuration: 구성
    - 캐싱 정책이나 추가적인 HTTP 헤더와 같은 Session의 프로퍼티들을 구성한다.


- `URLSession API`
    - 여러 유형의 API Session을 제공한다.
    - URLSession 객체가 소유한 Configuration 프로퍼티 객체에 의해 타입이 결정된다.

### 3. URLSession의 종류와 구성

1. 공유 세션 (Shared Session)
    1. 싱글톤으로 사용하는 기본 요청이다.
    2. 직접 만든 Session만큼의 맞춤 요청은 아니지만, 쉽게 만들어 사용할 수 있다는 장점이 있다.
    3. `URLSession.shared()`


2. 기본 세션 (Default Session)
    1. 공유 세션과 유사하게 작동하지만, 직접 원하는 설정이 가능하며 캐싱과 쿠키 정책을 disk에 저장, 순차적 데이터 처리를 위해 delegate를 지정할 수 있다는 점에서 다르다.
    2. `URLSession(configuration: .default)`


3. 임시 세션 (Ephemeral Session)
    1. 공유 세션과 유사하지만, 캐싱•쿠키•사용자 인증 정보를 disk에 저장할 수 없다는 점에서 다르다.
        
        → 메모리에 올려 세션과 연결하고, 만료 시 데이터가 사라진다.
        
    2. `URLSession(configuration: .ephemeral)`


4. 백그라운드 세션 (Background Session)
    1. App이 실행되지 않는 동안 Background에서 컨텐츠를 업로드하고 다운로드를 수행한다.
    2. `URLSession(configuation: .background)`
    

### 4. URLSessionTask

- 각 세션 내에 작업을 추가하는 것을 말한다.


- 종류


    - `URLSessionDataTask`
        - 데이터 객체를 사용해 데이터를 요청하고 응답 받는다.
        - 짧고 빈번한 경우에 사용한다.


    - `URLSessionUploadTask`
        - 데이터 객체와 파일 형태의 데이터를 업로드한다.
        - background 업로드를 지원한다.


    - `URLSessionDownloadTask`
        - 데이터를 다운로드 받아 파일 형태로 저장하는 작업을 수행한다.
        - background 업로드를 지원한다.


    - `URLSessionStreamTask`
        - 웹 소켓 프로토콜 표준을 통해 통신한다.


    - `URLSessionWebSocketTask`
        - TCP / IP URL 연결과 생성에 사용한다.

### 5. URLSession LifeCycle

1. Session Configuration 결정 → Session 생성
2. 통신할 URL, Request 객체 생성
4. 사용할 Task 선택, 그에 맞는 Completion Handler(또는 Delegate 메소드) 작성
5. Task 실행
6. 완료 후 Completion Handler 클로저 호출
