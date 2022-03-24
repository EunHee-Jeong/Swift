## @frozen, @discardableResult, 접근 제한자 (fileprivate, private)

### 1. @frozen

- 고정되어 있다는 의미.
- **나중에 추가적인 case가 생기지 않음을 약속**하는 키워드이다.
- 비교
    1. `@frozen`을 붙여주지 않은 코드
        
        ```swift
        func example1(_ sizeClass: UIUserInterfaceSizeClass) {
        	switch sizeClass {
        	case .regular:
        		break
        	case .unspecified:
        		break
        	case .compact:
        		break
        	@unknown default:
        	// 이 부분(@unknown)이 없다면 추후 새로운 case가 추가 되더라도 default로 빠져버리게 됨.
        	// -> 추가된 case를 처리할 수 없음!
        		fatalError()
        	}
        }
        ```
        
    2. `@frozen` 이 붙은 코드
        
        ```swift
        func example2(n: ComparisonResult) {  // ComparisonResult -> @frozen이 붙어 있는 enum
        	switch n {
        		case .orderedAscending:
        			break
        		case .orderedDescending:
        			break
        		case .orderedSame:
        			break
        	}
        }
        ```
        
        - Optional 타입도 `@frozen`으로 정의되어 있음!
            
            ```swift
            @frozen public enum Optional<Wrapped> : ExpressibleByNilLiteral {
                case none
                case some(Wrapped)
            
                ... 
            }
            ```
            
    

→ 즉 `@frozen` 을 사용하면 **default 과정을 없애주어 불필요한 부분을 없애고 컴파일 시간을 줄여준다**는 이점이 있다는 것을 알 수 있다.

<br>

### 2. @discardableResult

- 결과 값을 버릴 수 있다는 의미이다..
- 함수의 return 값을 사용하지 않더라도 경고 메시지가 뜨지 않도록 설정해준다.
- 예시
    
    ```swift
    class ViewController: UIViewController {
    
    	override func viewDidLoad() {
    		super.viewDidLoad()
    		returnFunction(count: 30)
    	}
    
    	@discardableResult
    	func returnFunction(count: Int) -> String {
    		if count >= 3 { print("3이상") }
    		else { print("3이하") }
    		return String(describing: count)
    	}
    }
    ```

<br>


### 3. 접근 제한자 fileprivate, private의 차이점

- `fileprivate`
    - 동일한 파일 내부에서만 접근할 수 있게 한다.
    - 해당 클래스가 정의된 소스 코드 안에서만 접근 가능하다는 소리임
    - 같은 파일 내에서 여러 타입을 정의하는 경우에 붙여준다.
- `private`
    - 가장 제한된 접근 수준이다.
    - 코드가 선언된 영역 내에서만 접근이 가능함.
