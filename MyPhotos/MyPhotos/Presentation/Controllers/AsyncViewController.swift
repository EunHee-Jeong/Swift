//
//  AsyncViewController.swift
//  MyPhotos
//
//  Created by 정은희 on 2022/02/01.
//

import UIKit

final class AsyncViewController: UIViewController {
    
    // MARK: - @IBOutlet Part
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - @IBAction Part
    @IBAction func touchUpDownloadButton(_ sender: UIButton) {
        guard let imageURL: URL = URL(string: "https://img.redbull.com/images/c_fill,g_auto,w_1500,h_960/q_auto,f_auto/redbullcom/2016/09/20/1331818966444_2/pok%C3%A9mon-super-mystery-dungeon") else { return }
        OperationQueue().addOperation {
            do {
                let imageData: Data = try Data.init(contentsOf: imageURL)   // sync 부분
                guard let image: UIImage = UIImage(data: imageData) else { return }
                OperationQueue.main.addOperation {
                    self.imageView.image = image    // UI와 관련된 코드는 메인 스레드에서 동작하도록
                }
            } catch { return }
        }
    }
}
