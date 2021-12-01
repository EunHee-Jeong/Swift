//
//  SecondVC.swift
//  DataPassing
//
//  Created by 정은희 on 2021/11/30.
//

import UIKit

class SecondVC: UIViewController {
    
    // MARK: - Properties
    static let identifier = "SecondVC"
    var receivedText = ""

    // MARK: - @IBOutlet Properties
    
    @IBOutlet var textField: UITextField!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondVC의 viewDidLoad 호출")
        
        // 1. 프로퍼티에 접근해서 넘겨주는 방법
        textField.text = receivedText
        
        // 1️⃣ present-push시에 데이터를 넘겨주는 방식
    }
    
    // MARK: - @IBAction Properties

    @IBAction func touchUpToSendData(_ sender: Any) {
        
        // 3. presentingVC에 데이터를 넘겨주는 방법
//        let presentingVC = presentingViewController as? FirstVC
//        presentingVC?.textField.text = textField.text
//        dismiss(animated: true, completion: nil)
        
        // 3️⃣ NotificationCenter를 활용해 넘겨주는 방식
        NotificationCenter.default.post(name: NSNotification.Name("iOS-Sample"),
                                        object: textField.text ?? "")
    }
    
    // MARK: - Custom Method
    
    func setDataInTextField(data: String) {
//        textField.text = data // ✔️ viewDidLoad보다 먼저 호출되므로 nil 오류 발생
        print("넘겨받은 data = \(data)")
        // ✔️ 해결 -> FirstVC에서 present 메서드의 completion 클로저 사용
        /* (뷰가 present 된 후에 클로저가 호출되므로,
         SecondVC의 뷰 관련 객체들이 로드 된 이후이기 때문에 정상적으로 작동한다.
         but 바뀌는 과정이 눈에 보인다는 점 유의하기
         */
    }
}
