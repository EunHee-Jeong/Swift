//
//  ViewController.swift
//  FloorIsLava
//
//  Created by 정은희 on 2022/04/20.
//

import UIKit
import SceneKit
import ARKit

final class ARViewController: UIViewController {
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var sceneView: ARSCNView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setScene()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setSceneConfiguration()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        setScenePause()
    }

    // MARK: - Functions
    private func setScene() {
        sceneView.delegate = self
        sceneView.showsStatistics = true
            
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        sceneView.scene = scene
    }
    
    private func setSceneConfiguration() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        sceneView.session.run(configuration)
    }
    
    private func setScenePause() {
        sceneView.session.pause()
    }
    
    /*
     용량이 큰 객체를 사용(= 이미지 캐싱)할 것이기 때문에 메모리를 지워주는 메서드를 호출해줌.
     ViewDidUnload()는 메모리로부터 경고를 받은 후 호출되기 때문에, didReceiveMemoryWarning() 메서드를 통해 제거와 해제를 시켜주는 것이다.
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ARViewController: ARSCNViewDelegate {
    
    // MARK: - 비행기
    private func createPlaneNode(anchor: ARPlaneAnchor) -> SCNNode {
        
        // 1. 비행기 객체 생성
        let plane = SCNPlane(width: CGFloat(anchor.extent.x), height: CGFloat(anchor.extent.z))

        let lavaImage = UIImage(named: "Lava")
        let lavaMeterial = SCNMaterial()
        
        lavaMeterial.diffuse.contents = lavaImage
        lavaMeterial.isDoubleSided = true   // 양면으로 만들 것인지
        
        plane.materials = [lavaMeterial]
        
        // 2. 비행기를 감지할 node 생성
        let planeNode = SCNNode(geometry: plane)
        
        planeNode.position = SCNVector3Make(anchor.center.x, 0, anchor.center.z)
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2 , 1, 0, 0)
        
        return planeNode
    }
    
    // MARK: - 용암
    private func createFloorNode(anchor: ARPlaneAnchor) -> SCNNode {
        
        // 1. 바닥의 용암 객체 생성
        let floor = SCNFloor()
        
        let lavaImage = UIImage(named: "Lava")
        let lavaMaterial = SCNMaterial()
        
        lavaMaterial.diffuse.contents = lavaImage
        lavaMaterial.isDoubleSided = true
        
        floor.materials = [lavaMaterial]
        
        // 2. 바닥을 감지할 node 생성
        let floorNode = SCNNode(geometry: floor)
        
        floorNode.position = SCNVector3Make(anchor.center.x, 0, anchor.center.z)
        
        return floorNode
    }
    
    // MARK: -  node 감지
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // 노드를 기준으로 비행기 띄움
        // didAdd
        
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        let planeNode = createPlaneNode(anchor: planeAnchor)
        
        node.addChildNode(planeNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        // 비행기의 위치(= 카메라의 위치)가 바뀌면 노드를 업데이트
        // didUpdate
        
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        node.enumerateChildNodes { childNode, _ in
            childNode.removeFromParentNode()
        }
        
        let planeNode = createPlaneNode(anchor: planeAnchor)
        
        node.addChildNode(planeNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        // 바닥에 용암이 생성되면 비행기를 제거
        // didRemove
        
        guard anchor is ARPlaneAnchor else { return }
        
        node.enumerateChildNodes { childNode, _ in
            childNode.removeFromParentNode()
        }
    }
}
