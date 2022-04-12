## VIPER

![image](https://user-images.githubusercontent.com/70689381/162989587-63668b64-6d12-4d8d-9758-aa29841c190a.png)

### 😇  View-Interactor-Presenter-Entity-Router의 약자

### 😇  Router

- 전체 모듈에 대한 진입점 (= 전체 흐름이 들어옴)

- App의 일부를 알고 있는 논리적 모듈

- 다른 라우터를 호출할 수 있음

### 😇  Entity

- 앱을 구성하는 정보

- `Model`에 해당하는 부분

### 😇  Presenter

- 접착제

- `router`, `interactor`, `view`를 참조

- interactor에게 작업의 수행을 지시함

- 뷰를 업데이트함

### 😇  View

- UIViewController에 해당
    - UI 요소 뿐만이 아닌, 관련 작업들도 처리할 수 있음

### 😇  Interaction

- App의 척추 !

- 핵심 상호작용을 수행
    - ex - 인스타그램 피드 가져오기
    
- `entity` (모델) 설정이 필요함

- `presenter`로 접근해 상호작용을 수행함
    - ex - API 호출

---

### 출처
- [Swift: VIPER Design Pattern (Architecture, 2022, Xcode 12, Swift 5) - iOS Development](https://www.youtube.com/watch?v=hFLdbWEE3_Y)
