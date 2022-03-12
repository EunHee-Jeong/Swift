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
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)    // 기본 화면 설정
        window?.windowScene = windowScene

        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let rootViewController = UINavigationController(rootViewController: homeViewController)
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}

