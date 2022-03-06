//
//  LinkViewController.swift
//  UI
//
//  Created by 정은희 on 2022/03/06.
//

import UIKit

final class MovieViewController: UIViewController {
    
    // MARK: - Properties
    let movieView: UIView = MovieView()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        view = movieView
    }
}
