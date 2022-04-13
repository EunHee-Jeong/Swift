//
//  Presenter.swift
//  VIPER
//
//  Created by 정은희 on 2022/04/12.
//

import Foundation

/*
 - 모든 것을 묶어주는 접착제
 - object
 - 프로토콜로 구현
 - interactor, router, view를 참조함
 */

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    // 참조 관계 형성
    var router: AnyRouter? { get set }  // set은 선택사항
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    // 참조를 유지시켜주는 부분
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

final class UserPresenter: AnyPresenter {
    
    // MARK: - Properties
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            // 사용자 참조 목록을 가져오는 부분
            interactor?.getUsers()
        }
    }
    var view: AnyView?
    
    // MARK: - Functions
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "Something went wrong.")
        }
    }
}
