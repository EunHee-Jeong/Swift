//
//  AlertListCell.swift
//  Notification
//
//  Created by 정은희 on 2022/03/08.
//

import UIKit

class AlertListCell: UITableViewCell {
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var meridiemLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var alertSwitch: UISwitch!
    
    // MARK: - @IBAction Properties
    @IBAction func alertSwitchValueChanged(_ sender: UISwitch) {
        guard let data = UserDefaults.standard.value(forKey: "alertList") as? Data,
              var alerts = try? PropertyListDecoder().decode([AlertModel].self, from: data) else { return }
        alerts[sender.tag].isOn = sender.isOn
        UserDefaults.standard.set(try? PropertyListEncoder().encode(alerts), forKey: "alertList")
    }
    
    // MARK: - Functions
    func setData(alertData: AlertModel) {
        alertSwitch.isOn = alertData.isOn
        timeLabel.text = alertData.time
        meridiemLabel.text = alertData.meridiem
    }
}
