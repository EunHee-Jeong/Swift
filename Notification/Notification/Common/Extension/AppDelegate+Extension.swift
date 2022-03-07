//
//  AppDelegate+Extension.swift
//  Notification
//
//  Created by 정은희 on 2022/03/03.
//

import UIKit
import UserNotifications

import Firebase
import FirebaseMessaging

// ✅ Delegate 등록해주는 부분
/*
 뷰컨에 delegate가 구현되어 있다면, 알림을 받지 못하는 상황이 생길 가능성이 있기 때문에
 앱이 실행될 때 처음부터 delegate를 등록해주기 위해 AppDelegate에서 구현하는 것이다.
 */
extension AppDelegate: UNUserNotificationCenterDelegate {
    // 앱이 foreground 상태에서 알림을 수신했을 때 작동하는 메서드
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler
        completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound, .banner, .list])
    }
}

extension AppDelegate: MessagingDelegate {
    // ✅ 토큰이 갱신되는 시점 알려주는 부분
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        guard let token = fcmToken else { return }  // 토큰을 받았다면 옵셔널이 아니므로 확인할 필요 없어서 return
        print("FCM 등록토큰 갱신: \(token)")
    }
}
