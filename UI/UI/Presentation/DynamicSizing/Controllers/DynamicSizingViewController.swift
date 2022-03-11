//
//  DynamicSizingViewController.swift
//  UI
//
//  Created by 정은희 on 2022/02/11.
//

import UIKit

final class DynamicSizingViewController: UIViewController {
    
    // MARK: - Properties
    private var dummyData: [String] = [
        "test1",
        "test222test2222",
        "안녕하세요?\n안녕하세요?안녕하세요?",
        "test3\ntest3test3\ntest3test3test3test3test3test3test3test3test3",
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
    ]
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
        registerXib()
    }
    
    private func setTableView() {
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50   // 임시 높이
        tableView.rowHeight = UITableView.automaticDimension    // automaticDimension ➜ 동적 높이가 설정되는 것을 tableView에 알림 ➜ 목록이 모두 만들어지고 레이아웃을 계산한 다음 셀의 높이값을 재설정.
    }
    
    private func registerXib() {
        let nib = UINib(nibName: "DynamicSizingTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DynamicSizingTableViewCell")
    }
}

// MARK: - Extensions
extension DynamicSizingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DynamicSizingTableViewCell", for: indexPath) as? DynamicSizingTableViewCell else { return UITableViewCell() }
        let sampleModel = DynamicSizingModel(message: dummyData[indexPath.row])
        cell.bind(model: sampleModel)
        return cell
    }
}
