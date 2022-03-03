//
//  ViewController.swift
//  Notification
//
//  Created by 정은희 on 2022/03/03.
//

import UIKit
import UserNotifications

final class ViewController: UIViewController {

    // MARK: - Properties
    let userNotificationCenter = UNUserNotificationCenter.current()  // ✅ UNUserNotificationCenter → iOS에서 Push를 다루는 싱글톤 객체
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - @IBOutlet Properties
    @IBAction func notificationButtonClicked(_ sender: UIButton) {
        requestAuthorizationForNotification()
    }
    
    // MARK: - Functions
    // ✅ 사용자에게 알림 권한 요청하는 함수
    private func requestAuthorizationForNotification() {
        let options = UNAuthorizationOptions(arrayLiteral: [.badge, .sound, .alert])
        userNotificationCenter.requestAuthorization(options: options) { [weak self] sucsess, error in
            if sucsess {
                self?.sendLocalNotification(seconds: 3)    // 3초 후 알람 발생시킴
            } else {
                print("알림허용 요청 오류: \(error?.localizedDescription ?? "nil")")
            }
        }
    }
    
    // ✅ 푸시 알림으로 보낼 정보 세팅하는 함수
    private func sendLocalNotification(seconds: Double) {
        let content = UNMutableNotificationContent()
        content.title = "푸시알림 제목"
        content.body = "푸시알림 테스트 내용입니다."
        content.userInfo = ["targetScene": "Splash"]    // ✅ 푸시알림 받을 때 오는 데이터. userInfo를 사용해 deep link를 구현할 수 있음
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        userNotificationCenter.add(request) { error in
            print(#function, error ?? "nil")
        }
    }
}

