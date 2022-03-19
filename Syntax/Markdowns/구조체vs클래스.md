## Basic Syntax3

### 구조체와 클래스

- 여러 변수를 담을 수 있는 **컨테이너 타입**

    - 타입이니까 UpperCamelCase로 네이밍함
    
- 데이터를 용도에 맞게 묶어 표현할 때 사용한다.

- **프로퍼티**와 **메소드**를 이용해서 **데이터와 기능을 구조화**한다. 즉, 하나의 **사용자 정의 데이터 타입**을 만든다.

- 인스턴스(instance)

    - 직역 → '상황', '실체'
    
    - 클래스나 구조체, 열거형에서 생성된 객체를 말한다.
    
    - 즉 구조화 된 것을 토대로 만든 **객체**
    
- 프로퍼티(property)

    - 직역 → '재산', '소유물'
    
    - 클래스나 구조체, 열거형과 연관된 정보나 값을 의미한다.
    
    - 즉 내부에 있는 **값**
    
<img src="https://user-images.githubusercontent.com/70689381/153862869-9bdd5e2a-253f-43bc-b5d9-94b6e5ca8c74.jpeg" width=500>

<br>

1️⃣ 구조체

- Swift 기본 자료형 타입의 대부분을 구현하고 있다.
    
    (Int, Float, Double, Array, Set, ...)
    

```swift
struct Sample {
    var mutableProperty: Int = 100
    let immutableProperty: Int = 100
    static var typeProperty: Int = 100  // Sample이라는 타입 자체에서 사용할 수 있는 프로퍼티
    
    func instanceMethod() {
        print("instance method")
    }
    static func typeMothod() {  // Sample이라는 타입 자체에서 사용할 수 있는 메소드
                                // 일반 인스턴스(var, let으로 선언)에서 호출할 수 없음
        print("type method")
    }
}
var mutable: Sample = Sample()  // 가변 인스턴스
mutable.mutableProperty = 200
mutable.instanceMethod()    // instance method
let immutable: Sample = Sample()    // 불변 인스턴스
immutable.instanceMethod()  // instance method
Sample.typeMothod() // type method
```

<br>

2️⃣ 클래스

- 클래스의 타입 메소드

    - `static`
    
        - 재정의가 불가능하며, 타입 자체에서만 사용한다. 즉 **상속이 불가**능하다.
    - `class`
    
        - 재정의가 가능하다. 즉 **상속이 가능**하다.

```swift
class Sample2 {
    var mutableProperty: Int = 100
    let immutableProperty: Int = 100
    
    func instanceMethod() {
        print("instance method")
    }
    static func staticTypeMethod() {
        print("type method - static")
    }
    class func classTypeMethod() {
        print("type method - class")
    }
}
let immutableReference: Sample2 = Sample2()
immutableReference.mutableProperty = 200    // 참조형 타입이기 때문에 프로퍼티의 변경이 가능. (⭐️ 구조체와 다른 점)
```

<br>

3️⃣ 비교

- 공통점
    - 프로퍼티와 메서드를 통해 데이터와 기능을 구조화한다.
    - 사용자 지정 타입을 만든다.
    - 초기화 `init`을 정의해 초기 상태를 설정할 수 있다.
    - 확장 `extension`이 가능하다.
    - `.`을 사용해 프로퍼티에 접근한다.
    - 프로토콜을 사용할 수 있다.
- 차이점
    
    (👀 부제 - **값 타입 vs 참조 타입**)
    
    - 구조체 → 값 타입
    
        - 상속 불가 (공유 불가)
        
        - 데이터 전달 시 값을 복사해 전달
            (= 사본을 전달, call by value)
            
            - 항상 새로운 변수로 복사되기 때문에, 멀티 스레드 환경에서 문제가 생길 확률이 적음
            
        - 스택 메모리 영역에 할당됨 (→ 속도 빠름)
        
    - 클래스 → 참조 타입
    
      - 상속 가능 (레퍼런스 형태로 공유)
      
      - 데이터 전달 시 값의 메모리 위치를 전달
          (= 실제 값 참조, call by reference)
         
      - 힙 메모리 영역에 할당됨
      
      - Apple 프레임워크 대부분의 큰 뼈대들을 구성하고 있음
   
