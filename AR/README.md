## ARKit

### AR이란?

- Augumented Reality의 줄임말이다. 직역하자면 **증강 현실**이다.

- 개념

    - VR → `가상 현실` (= 실제로는 존재하지 않음)
    
        - ex - NAVER Z의 ZEPETO
        
    - AR → `실제 환경` + `가상 현실`
    
        - ex - PokemonGO

### ARKit

- iOS에서 증강 현실 `AR`을 가능하게 해주는 Framework

- iOS11 버전부터 지원된다.

- 2D는 `SpriteKit`, 3D는 `SceneKit`를 사용한다.

- 보통 카메라를 통해 이용하기 때문에, info.plist에서 NSCameraUsageDescription을 추가해줘야 한다.

- 기본 코드 예시
    
    ```swift
    import UIKit
    import SceneKit
    import ARKit
    
    class ViewController: UIViewController, ARSCNViewDelegate {
    
        @IBOutlet var sceneView: ARSCNView! // 3D 객체를 담을 수 있는 뷰 추가
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            sceneView.delegate = self   // 대리자 위임
            
            sceneView.showsStatistics = true    // 하단의 상태바 표시 여부
            
            let scene = SCNScene(named: "art.scnassets/ship.scn")!  // 추가할 Scene
            sceneView.scene = scene
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            let configuration = ARWorldTrackingConfiguration()  // ARSession을 실행시키기 위해 Configuration 객체 생성
            
            sceneView.session.run(configuration)    // 세션 실행
        }
    }
    ```
    
- 그 외

    - ARSCNViewDelegate의 `render()` 메소드를 통해 커스텀 node들을 만들 수 있다.
    
    - 기본으로 제공되는 노드들 → `SCNPlane`, `SCNBox`, `SCNPyramid`, `SCNSphere`, `SCNText`, `SCNFloor` 등
