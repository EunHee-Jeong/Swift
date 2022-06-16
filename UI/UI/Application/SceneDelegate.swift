//
//  SceneDelegate.swift
//  UI
//
//  Created by 정은희 on 2022/01/04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        let rootViewController = EasyTipViewSampleViewController()
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
    }
}

