## Basic Syntax 5

### 옵셔널 체인

- nil인지 아닌지 체크해야 할 값이 여러 개인 경우
    
    ```swift
    // 옵셔널 체인을 사용하지 않은 예시
    func guardJob(owner: Person?) {
    	if let owner = owner {
    		if let home = owner.home {
    			if let `guard` = home.guard {
    				if let guardJob = `guard`.guardJob {
    					print("우리집 경비원의 직업은 \(guardJob)입니다")
    				} else {
    						print("우리집 경비원은 직업이 없어요")
    				}
    			}
    		}
    	}
    }
    // 일일이 바인딩을 중첩해서 값을 하나하나 체크하므로 좋지 않은 코드.
    ```
    
    ```swift
    // 옵셔널 체인을 사용한 예시
    func guardJob(owner: Person?) {
    	if let guardJob = owner?.home?.guard?.guardJob {
    		print("우리집 경비원의 직업은 \(guardJob)입니다")
    	} else {
    		print("우리집 경비원은 직업이 없어요")
    	}
    }
    // 프로퍼티를 순서대로 하나하나 체크
    // 해당 값이 있다면 넘어가고, 없다면 else 블럭으로 빠짐
    ```
    

### nil 병합 연산자 `??`

- Optional 값과 value 사이에 위치한다. (= 중위 연산자임)
- Optional 값이 nil로 떨어진다면 → value의 값이 되는 방식

```swift
var guardJob: String = "경비원"

guardJob = owner?.home?.guard?.guardJob ?? "슈퍼맨"
print(guardJob)  // 경비원

owner?.home?.guard?.guardJob = nil
guardJob = owner?.home?.guard?.guardJob ?? "슈퍼맨"
print(guardJob)  // 슈퍼맨
```

### 타입 캐스팅 `is` , `as`

- 해당 인스턴스의 타입이 무엇인지, 해당 인스턴스를 부모나 자식 타입처럼 사용할 수 있는지 처리하기 위해 사용된다.
- 형변환과 같은 개념으로 보면 된다.

1. `is`
    - 타입이 맞는지 확인하기 위해 사용하는 키워드이다.
    - 해당 인스턴스가 우측의 타입에 해당하는지의 여부를 **bool값으로 반환**한다.
        
        → **if문, switch문을 활용**할 수 있다.
        
    
    ```swift
    var majayong: Pokemon = Pokemon()
    var eunHee: Person = Person()
    var milkBread: Bread = Bread()
    
    var result: Bool
    
    if majayong is Pokemon {
    	print("조건문도 활용 가능하며")
    }
    
    switch milkBread {
    case is Pokemon:
    	print("milkBread는 포켓몬입니다.")
    case is eunHee:
    	print("milkBread는 은희입니다.")
    case is milkBread:
    	print("milkBread는 우유빵입니다.")
    default:
    	print("milkBread는 포켓몬도, 은희도, 우유빵도 아닙니다")
    }  // milkBread는 우유빵입니다.
    ```
    

2-1. `as`

- 자식 클래스를 부모 클래스 취급하는 것으로, **업캐스팅**이라고 한다.
- 컴파일러가 타입을 체크하며 코드 오류를 확인할 때, 타입 정보를 전달해주는 역할을 한다.
    - 암시적으로 처리되는 경우도 있기 때문에, 명시적으로 표기해야 하는 경우가 아니라면 생략해도 된다.
- 성공이 보장된 변환 방식이다. (∵ 자식 클래스 ⊆ 부모 클래스)

2-2. `as?`

- 변환하고자 하는 클래스가 꼭 자식 클래스와 부모 클래스 관계라는 보장이 없기 때문에, 안전을 위해 성공하더라도 Optional 값으로 뱉어내도록 한다.
- **조건부 다운 캐스팅**이라고 한다.

```swift
let pokemonName: String = notification.object as? String ?? "포켓몬"
// nil로 떨어질 경우 pokemonName에 포켓몬이 들어감
```

2-3. `as!`

- 강제 다운 캐스팅이다.
- 반드시 성공한다는 가정을 전제로 타입을 바꾸기 때문에, 실패하면 런타임 에러가 발생하게 된다.
    - 값이 있다고 보장이 되는 경우에만 사용해야 한다.
- nil이 나올 수 없는 구조이기 때문에 nil 병합 연산자 `??` 는 사용할 수 없다.
