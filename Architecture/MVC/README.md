## MVC와 Cocoa-MVC

### ✨ 전통적인 MVC

<img src="https://user-images.githubusercontent.com/70689381/163336830-9acff53a-afe0-488f-b3c1-af3998ee7c12.png" width=850>

1. Model

    - data를 캡슐화하고, 기본적인 동작들을 설정해주는 부분
    
    - 특정 주제 영역에 관련한 정보들을 표현하므로, 재사용 가능한 경향이 있다.
    
    - 유저 인터페이스와 명시적인 연결점이 없다.
    
        - 뷰와 직접적으로 연동 되어서는 안된다.
        
            - 언제 presentation 할 지에 대한 책임을 가지면 안된다.
            - 즉, 객체나 인터페이스의 presentation issue와는 무관하다.
2. View

    - model의 데이터를 어떻게 표시할 지, 혹은 편집할 지를 정의하는 부분
    
    - data 저장에는 책임을 가지지 않는다.
    
    - 하나의 view 객체가 model 전체, 여러 model을 보여줄 수도 있다.
    
        - 즉 재사용 가능하며 설정 가능하다 !
        
    - Cocoa-app에서 View는 일관성이 있어야 한다.
    
    - model의 상태를 실시간으로 정확하게 보여주어야 하므로, model의 값이 변경되는 것을 알고 있어야 한다.
    
        - model의 변경을 알리는 generic way가 필요하다.
        
3. Controller

    - Model과 View를 연결한다.
    
        - View가 Model에 접근할 수 있도록 보증하며, View에게 Model의 변화를 알려주는 사이의 중재자 같은 역할을 한다.
        
    - App의 전반적인 설정이나 task 스케줄링, 객체들의 life-cycle을 담당한다.
    
    - Cocoa에서의 Controller
    
        - Model Controller
        
            - 모델을 조정하는 액션 메서드들이 구현된 컨트롤러
            - `NSDocument`
            
        - View Controller
        
            - 뷰와 인터페이스를 직접 소유하는 , view-layer에 관련된 컨트롤러
            - `NSWindowController`
            
        - Mediating Controller
        
            - Cocoa bindings 기술에 사용되는 컨트롤러
                - view-controller 바인딩
                - controller-model 바인딩
                
            - 추상 클래스를 사용하기 때문에, 직접 사용할 수는 없고 상속받아 overriding해서 사용함
            
        - Coordinating Controller
        
            - App의 기능성을 감독하고 조정
            
                - delegation 메시지 응답, notification 감지, action 메시지 응답, 소유한 객체의 life-cycle 관리, 객체 간의 연결점 만들기, 설정 작업 수행 등
                - 주로 nib 파일에 저장된 객체를 관리함
                
            - `NSWindowController`, `NSDocumentController`
            
        - Medi + Coord Controller
        
            - `NSObject`를 상속 받아 커스텀한 subclass의 인스턴스를 말함
            
            - Mediating과 Cooridinating 기능을 결합함
            
                - View와 Model 간의 data 이동 구현에 target-action, outlets, delegation 넣기 등
                
            - connect하는 용도로 사용되므로, 가장 재사용성이 적음

### ✨ MVC 디자인 패턴

1. `복합적` Composite ⇒ View

    - view hierarchy
    
        - window, compound-view (ex- tableView), individual-view (ex- button) 등을 포함함

2. `해석적` Strategy ⇒ Controller

    - 컨트롤러 객체들은 하나 이상의 뷰 객체들을 구현해야 함
    
        - view의 기능은 visual적인 측면을 유지하는 것에 한정되기 때문임
        - controller는 인터페이스의 동작들이 구체적으로 어떻게 흘러갈 것인지를 정의함
        
3. `관찰적` Observer ⇒ Model

    - model의 data가 궁금한 view와 같은 객체들에게 model의 상태 변화를 계속해서 알려줌

### ✨ 정리

- 사용자가 View를 조작 → event 발생 → Controller가 event를 받아 해석 (Strategy)

- Strategy

    - model에게 상태 변경을 요청
    
    - view에게 외형이나 동작의 변경을 요청

---

### ✨ Cocoa-MVC가 발생한 이유

- View → App에 정의된 내용을 OS가 보고 느끼는 대로 표현한 것

    - 외형과 기능의 일관성이 필수적이며, 객체들이 높은 수준의 재사용성을 가질 수 있어야 함
    
    - view 객체들이 전부 다르고 재사용성이 떨어지게 된다면, 화면에 띄워주는 데 많은 load를 잡아먹기 때문임
    
- Model → 정의된 대로 특정 영역에 연관된 data들을 캡슐화하고, 그에 대한 동작을 수행함

- 즉 설계 측면에서 재사용성을 강화하기 위해 Model과 View 객체를 강하게 분리하게 되었다 !

### ✨ Cocoa-MVC

<img src="https://user-images.githubusercontent.com/70689381/163337487-e0102055-ed7d-4844-9a61-f45b273ed4ef.png" width=850>


- MVC의 목적인 재사용성 극대화를 위해 Apple이 수정한 가이드라인을 말한다.

    - Starategy 패턴만 가지던 Controller가 Mediator 패턴도 포함하게 되었음
    
        - Mediator → View와 Model 사이의 쌍방향 data-flow를 중재
        
    - View가 target-action 메커니즘에 따라 Command 패턴을 포함하게 되었음
    
        - target-action 메커니즘 → view 객체가 사용자의 입력과 선택을 전달할 수 있도록 하는 메커니즘
        
    - 클래스 간의 의존성을 최소화함
