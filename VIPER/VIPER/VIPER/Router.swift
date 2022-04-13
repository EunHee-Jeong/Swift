//
//  Router.swift
//  VIPER
//
//  Created by 정은희 on 2022/04/12.
//

// 다른 파일로 이동시켜주는 부분
// Application 전체를 탐색, 라우팅

import Foundation
import UIKit

/*
 - Application -> 여러 모듈을 가짐
 - router -> 자체 모듈 내에서 라우팅
    ex) 5개의 탭을 가지는 App -> 각 탭들이 모듈이 되는 것 ...
 - object
 - entry point -> 각 모듈의 진입점 (= 아키텍처의 시작점)
 */

// MARK: - Initialization
typealias EntryPoint = AnyView & UIViewController

// 라우터 설정
protocol AnyRouter {
    // view를 참조 (이를 통해 SceneDelegate에 앱의 진입점을 알려줄 수 있음)
    var entry: EntryPoint? { get }
    
    static func start() -> AnyRouter
}

// 라우터 구현 (VIPER의 모든 구성 요소를 설정하고 반환하는 부분 !!)
final class UserRouter: AnyRouter {
    
    // MARK: - Protocols
    var entry: EntryPoint?
    
    // MARK: - Functions
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        // 내부에 다른 바이퍼를 할당해주는 부분
        
        // 1. view, interactor, presenter 설정
        var view: AnyView = UserViewController()
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInteractor = UserInteractor()
        
        // 2. 참조 설정
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        router.entry = view as? EntryPoint
        
        return router
    }
}
