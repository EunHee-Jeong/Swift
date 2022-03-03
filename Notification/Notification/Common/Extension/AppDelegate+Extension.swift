//
//  AppDelegate+Extension.swift
//  Notification
//
//  Created by 정은희 on 2022/03/03.
//

import UIKit
import UserNotifications

// ✅ Delegate 등록해주는 부분
/*
 뷰컨에 delegate가 구현되어 있다면, 알림을 받지 못하는 상황이 생길 가능성이 있기 때문에
 앱이 실행될 때 처음부터 delegate를 등록해주기 위해 AppDelegate에서 구현하는 것이다.
 */
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler
        completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound, .banner])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let _ = response.notification.request.content.userInfo  // deep link 처리하려면 와일드카드 이용
        
        completionHandler()
    }
}
