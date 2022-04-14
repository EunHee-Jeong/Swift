//
//  SceneDelegate.swift
//  VIPER
//
//  Created by 정은희 on 2022/04/12.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // 라우터 생성 -> 뷰컨을 보여주는 식으로 진행됨
        let userRouter = UserRouter.start()
        let initialViewController = userRouter.entry
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = initialViewController
        self.window = window
        window.makeKeyAndVisible()
    }
}

