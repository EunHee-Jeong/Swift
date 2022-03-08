//
//  AppDelegate.swift
//  Notification
//
//  Created by 정은희 on 2022/03/03.
//

import UIKit
import UserNotifications

import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var userNotificationCenter: UNUserNotificationCenter?
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        userNotificationCenter?.requestAuthorization(options: authOptions) { _, error in
            if let error = error {
                print("ERROR: notification authorization request \(error.localizedDescription)")
            }
        }
        
        FirebaseApp.configure() // ✅ Firebase 초기화
        
        // ✅ FCM에 현재 등록된 토큰 알려주는 부분
        Messaging.messaging().delegate = self
        Messaging.messaging().token { token, error in
            if let error = error {
                print("ERROR FCM 등록토큰 가져오기: \(error.localizedDescription)")
            } else if let token = token {
                print("FCM 등록토큰: \(token)")
            }
        }
        
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { _, error in
            print("Error, Request Notifications Authorization: \(error.debugDescription)")
        }
        application.registerForRemoteNotifications()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

