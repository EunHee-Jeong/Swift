//
//  MainViewController.swift
//  MyPhotos
//
//  Created by 정은희 on 2022/01/29.
//

import UIKit

import Photos

class MainViewController: UIViewController {
    
    // MARK: - Properties
    var fetchResult: PHFetchResult<PHAsset>!    // 결과 (가져온 사진(에셋)) 담음
    let imageManager: PHCachingImageManager = PHCachingImageManager()   // 결과를 로드
    let cellIdentifier: String = "cell"
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var photoListTableView: UITableView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkAuthorization()
        requestCollection()
    }

    // MARK: - Functions
    private func checkAuthorization() {
        // 뷰가 로드되면, (viewDidLoad)
        // 사용자가 사진을 허가했는지 확인해야 한다.
        
        let photoAutorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAutorizationStatus {
        case .authorized:
            print("접근 허가")
            self.requestCollection()    // 컬렉션 불러옴
            self.photoListTableView.reloadData()
        case .denied:
            print("접근 불허")
        case .limited, .restricted:
            print("접근 제한")
        case .notDetermined:
            print("아직 응답 안함")
            PHPhotoLibrary.requestAuthorization({ status in // 다시 허가 요청
                switch status {
                case .authorized:
                    print("사용자가 허용함")
                    OperationQueue.main.addOperation {
                        // reload 된 데이터가 메인 스레드에서만 동작할 수 있도록 함
                        self.photoListTableView.reloadData()
                    }
                case .denied:
                    print("사용자가 불허함")
                case .limited, .restricted:
                    print("접근 제한")
                default:
                    break
                }
            })
        @unknown default:
            break
        }
        self.photoListTableView.reloadData()
    }
    
    private func requestCollection() {
        // cameraRoll(사진첩) 가져옴
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum,
                                                                                                   subtype: .smartAlbumUserLibrary,
                                                                                                   options: nil)
        
        // 사진들을 최신순으로 sort
        guard let cameraRollCollection = cameraRoll.firstObject else { return }
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
    }
}

// MARK: - Extensions
extension MainViewController: UITableViewDelegate { }

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = photoListTableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let asset: PHAsset = fetchResult.object(at: indexPath.row)
        imageManager.requestImage(for: asset,
                                     targetSize: CGSize(width: 30, height: 30),
                                     contentMode: .aspectFill,
                                     options: nil,
                                     resultHandler: { image, _ in
            cell.imageView?.image = image
        })
        return cell
    }
}
