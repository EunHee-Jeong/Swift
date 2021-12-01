//
//  FirstVC.swift
//  DataPassing
//
//  Created by 정은희 on 2021/11/30.
//

import UIKit

class FirstVC: UIViewController {
    
    // MARK: - Properties
    static let identifier = "FirstVC"

    // MARK: - @IBOutlet Properties

    @IBOutlet var textField: UITextField!
 
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - @IBAction Properties

    @IBAction func touchUpToSendData(_ sender: Any) {
        
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else {return}
        
        // 1️⃣ present-push시에 데이터를 넘겨주는 방식
        
        // 1. 프로퍼티에 접근해서 넘겨주는 방법
//        nextVC.setDataInTextField(data: textField.text ?? "")
//        nextVC.receivedText = textField.text ?? ""
        present(nextVC, animated: true, completion: nil)
//        present(nextVC, animated: true) {
//            nextVC.setDataInTextField(data: "이렇게 하면 가능")
//        }
        
        // 2️⃣ segue를 통해 넘겨주는 방식
//        performSegue(withIdentifier: "presentingSecondVC", sender: sender)  // 해당 identifier를 가진 세그 시작

        
        // 3️⃣ NotificationCenter를 활용해 넘겨주는 방식
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(dataReceived),
                                               name: NSNotification.Name("iOS-Sample"),
                                               object: nil)
        // iOS-Sample이라는 이름을 가진 알림이 들어오면, dataReceived 함수 실행
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        /*
//         prepare(for: sender:) ➡️ 세그를 통한 화면 전환이 일어나기 전에 불리는 메서드
//         VC에게 세그가 실행될 것을 알림 (= 실행 전 준비작업)
//         */
//        if segue.identifier == "presentingSecondVC" {
//            let nextVC = segue.destination as? SecondVC
//            nextVC?.receivedText = textField.text ?? ""
//        }
//    }
    
    @objc func dataReceived(notification: NSNotification) {
        if let text = notification.object as? String {  // 전달할 객체가 있다면 타입 캐스팅
            textField.text = text
        }
    }
    
}
