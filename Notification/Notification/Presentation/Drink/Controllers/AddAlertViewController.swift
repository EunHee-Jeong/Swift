//
//  AddAlertViewController.swift
//  Notification
//
//  Created by 정은희 on 2022/03/08.
//

import UIKit

final class AddAlertViewController: BaseViewController {
    
    // MARK: - Properties
    var pickedDate: ((_ date: Date) -> Void)?
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - @IBAction Properties
    @IBAction func touchUpToDismissButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func touchUpToSaveButton(_ sender: UIBarButtonItem) {
        pickedDate?(datePicker.date)
        self.dismiss(animated: true)
    }
}
