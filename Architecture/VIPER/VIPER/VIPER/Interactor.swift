//
//  Interactor.swift
//  VIPER
//
//  Created by 정은희 on 2022/04/12.
//

// https://jsonplaceholder.typicode.com/users

import Foundation

/*
 - object
 - 프로토콜로 구현
 - presenter를 참조함
 - 작업을 이동시켜 데이터를 얻거나 상호작용 하는 등을 수행하고, 완료되면 presenter에게 전달함
 (= API 호출에 필요한 데이터 목록과 같은 presenter가 처리할 작업들을 건네줌)
 */

// MARK: - Initialization
protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }    // presenter에 대한 참조
    func getUsers() // presenter가 수행할 작업들
    /*
     idea가 준비되면 presenter에게 바로 알리기 때문에, completion handler를 사용하지 않음.
     (= call back을 받는 대신 매개변수를 사용하지 않음)
     */
}

final class UserInteractor: AnyInteractor {
    
    // MARK: - Properties
    var presenter: AnyPresenter?
    
    // MARK: - Functions
    func getUsers() {
        print("Start fetching")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed)) // 오류 발생 시 presenter로부터 오류의 유형을 가져옴
                return
            }
            do {
                let entities = try JSONDecoder().decode([User].self, from: data)    // response
                self?.presenter?.interactorDidFetchUsers(with: .success(entities))
            }
            catch {
                self?.presenter?.interactorDidFetchUsers(with: .failure(error))
            }
        }
        task.resume()
    }
}
