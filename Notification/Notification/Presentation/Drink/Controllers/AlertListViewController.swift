//
//  AlertListViewController.swift
//  Notification
//
//  Created by 정은희 on 2022/03/08.
//

import UIKit

final class AlertListViewController: UITableViewController {

    // MARK: - Properties
    private var alertList: [AlertModel] = [ ]
    
    // MARK: - @IBOutlet Properties
    @IBOutlet var alertListTableView: UITableView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNib()
        assignDelegation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        alertList = getAlertList()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func addAlertAction(_ sender: UIBarButtonItem) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "AddAlertView") as? AddAlertViewController else { return }
        
        nextVC.pickedDate = { [weak self] date in
            guard let self = self else { return }
            
            var newAlertList = self.getAlertList()
            
            // ✅ nextVC에서 추가한 알림 값들
            let newAlert = AlertModel(date: date, isOn: true)
            newAlertList.append(newAlert)
            newAlertList.sort { $0.date < $1.date }
            
            self.alertList = newAlertList
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alertList), forKey: "alertList")
            self.alertListTableView.reloadData()
        }
        self.present(nextVC, animated: true)
    }
    
    // MARK: - Functions
    // ✅ 각 셀들의 상태를 확인하기 위한 함수
    private func getAlertList() -> [AlertModel] {
        guard let data = UserDefaults.standard.value(forKey: "alertList") as? Data,
              let alerts = try? PropertyListDecoder().decode([AlertModel].self, from: data) else { return [ ] }
        return alerts
    }
    
    private func registerNib() {
        let nib = UINib(nibName: "AlertListCell", bundle: nil)
        alertListTableView.register(nib, forCellReuseIdentifier: "AlertListCell")
    }
    
    private func assignDelegation() {
        alertListTableView.delegate = self
        alertListTableView.dataSource = self
    }
}

// MARK: - Extensions
extension AlertListViewController {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            self.alertList.remove(at: indexPath.row)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alertList), forKey: "alertList")
            self.alertListTableView.reloadData()
            return
        default:
            break
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alertList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlertListCell", for: indexPath) as? AlertListCell else { return UITableViewCell() }
        cell.setData(alertData: alertList[indexPath.row])
        cell.alertSwitch.tag = indexPath.row
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "🚰 물 마실 시간"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
