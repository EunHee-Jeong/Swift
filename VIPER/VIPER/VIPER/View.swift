//
//  View.swift
//  VIPER
//
//  Created by 정은희 on 2022/04/12.
//

import Foundation
import UIKit

/*
 - ViewController
 - 프로토콜로 구현
 - presenter를 참조함
 - 구체적인 구현부
 */

protocol AnyView {
    // presenter에 대한 참조
    var presenter: AnyPresenter? { get set }
    
    // user와의 상호작용에 관련된 부분
    func update(with users: [User])
    func update(with error: String)
}

final class UserViewController: UIViewController, AnyView {
    
    // MARK: - Properties
    var presenter: AnyPresenter?
    var users: [User] = []
    private let userTableView: UITableView = {
       let userTable = UITableView()
        userTable.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        userTable.isHidden = true
        return userTable
    }()
    private let wrongLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        assignDelegation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        userTableView.frame = view.bounds   // interactor를 레이아웃 뷰의 서브뷰로 재정의
        wrongLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        wrongLabel.center = view.center
    }
    
    func setUI() {
        view.addSubview(userTableView)
        view.addSubview(wrongLabel)
        view.backgroundColor = .systemBlue
    }
    
    func assignDelegation() {
        userTableView.delegate = self
        userTableView.dataSource = self
    }
    
    func update(with users: [User]) {
        DispatchQueue.main.async {
            print("got users")
            self.users = users
            self.userTableView.reloadData()
            self.userTableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.users = []
            self.userTableView.isHidden = true
            self.wrongLabel.isHidden = false
            self.wrongLabel.text = error
        }
    }
}

// MARK: - Extensions
extension UserViewController: UITableViewDataSource { }

extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
}
