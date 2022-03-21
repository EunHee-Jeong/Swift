## Basic Syntax 6

### assert

- **동적으로 생성되는 값들을 확인하고 안전하게 처리**하기 위한 키워드이다.
    
    `assert(참이 되는 조건, “해당 조건이 거짓이라면 띄울 메시지")`
    
    - 예시
        
        ```swift
        var someInt: Int = 0
        assert(someInt != 0, "someInt = 0")
        ```
        
        - 디버깅 모드에서만 작동하는 코드이다.
    
    `assertionFailure(”해당 조건이 거짓이라면 띄울 메시지”)`
    
    - 예시
        
        ```swift
        guard let cell = anyCell as? MyCustomCell else {
        			assertionFailure("예상하지 못한 셀 타입: \(type(of: anyCell))")
        			return anyCell
        }
        ```
        
        - 절대로 진입하면 안 되는 코드블럭에 작성해두면 디버깅 시 유용하게 확인할 수 있다.
- 그 외에도 `precondition()`, `preconditionFailure()`, `fatalError()` 등의 메서드들이 있다.

### guard

- **동적으로 생성되는 값들을 확인**하고 **안전하게 분기 처리**하기 위한 키워드이다.
- 선언문 앞에 붙이며, 잘못된 값이 전달 되었을 경우 구문을 종료시킨다.
    
    `guard (조건) else { 조건이 false 일 때 실행되는 부분 }`
    
    - else 블럭 안에는 break나 return과 같은 종료 구문이 포함되어야 한다.
- 👀 `guard-let`과 `if-let`의 차이점
    - guard-let을 통해 선언한 변수는 **메소드 내**에서 **지역 상수**처럼 사용이 가능하지만,
    - if-let을 통해 사용한 변수는 **if문 내에서만** 사용이 가능하다.
    

### Protocol

- 특정 기능•역할을 수행하기 위한 메서드, 프로퍼티, 이니셜라이저와 같은 **요구 사항**들이 적힌 설명서이다.
    
    ```swift
    protocol Talkable {
    	var topic: String { get set } // ⭐️ 반드시 변수만 가능 (상수 xxx), 접근자와 설정자 명시해야 함
    	var language: String { get }
    	func talk()
    	init(topic: String, language: String)
    }
    ```
    
- **구현은 다른 타입에게 넘긴다.**
    - 프로토콜을 채택 받아서 구현할 다른 타입들 → **구조체, 클래스, 열거형**
    - 채택이 되면 안에 프로토콜 내의 요구 사항들을 전부 구현해줘야 한다.
    - 여러 개의 프로토콜을 동시에 채택할 수 있다.

### Extension

- **타입**들에 **새로운 기능을 추가**하는 키워드이다.
    - 구조체, 클래스, 열거형, Int, Array, ...
- 타입의 이름만 알고 있어도 확장이 가능하다. (= 내부의 자세한 구현을 몰라도 확장할 수 있다.)
    
    ```swift
    extension 확장할 타입 이름 {
    	// 타입에 추가될 새로운 기능 구현부
    }
    ```
    
- 상속과 비슷하지만, **모든 타입**에 확장이 가능하며 **기존에 있는 기능을 재정의 할 수 없다**는 점에서 다르다.
