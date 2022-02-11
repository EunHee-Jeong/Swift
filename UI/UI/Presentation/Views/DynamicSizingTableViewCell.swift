//
//  DynamicSizingTableViewCell.swift
//  UI
//
//  Created by 정은희 on 2022/02/11.
//

import UIKit

final class DynamicSizingTableViewCell: UITableViewCell {
    
    // MARK: - UI
    @IBOutlet weak var messageLabel: UILabel!
    
    // MARK: - Bind
    public func bind(model: DynamicSizingModel) {
        messageLabel.text = model.message
    }
}
