//
//  ImageZoomViewController.swift
//  MyPhotos
//
//  Created by 정은희 on 2022/02/02.
//

import UIKit

import Photos

final class ImageZoomViewController: UIViewController {
    
    // MARK: - Properties
    var asset: PHAsset! // 이전 화면에서 받아올 에셋 프로퍼티
    private let imageManager: PHCachingImageManager = PHCachingImageManager()   // 이미지를 요청할 매니저
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setImage()
    }
    
    // MARK: - Functions
    private func setImage() {
        imageManager.requestImage(for: asset,
                                     targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                     contentMode: .aspectFill,
                                     options: nil,
                                     resultHandler: { image, _ in
            self.imageView.image = image
        })
    }
}

// MARK: - Extensions
extension ImageZoomViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        // viewForZooming → 스크롤뷰가 zoom을 해줄 대상인 view를 지정.
        return self.imageView
    }
}
