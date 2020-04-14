//: [Previous](@previous)

import UIKit
import SceneKit
import SceneKit.ModelIO
import PlaygroundSupport

class spaceView:UIViewController{
    let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 600, height: 480))
    var appleNode = SCNNode()
    override func loadView() {
        sceneView.showsStatistics = true
        sceneView.backgroundColor = .white
        sceneView.autoenablesDefaultLighting = true
        sceneView.scene = SCNScene()
        sceneView.allowsCameraControl = true
        sceneView.scene?.physicsWorld.gravity = SCNVector3(0, -20, 0)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y:0, z: 50)
        sceneView.scene?.rootNode.addChildNode(cameraNode)
        self.view = sceneView
    }
    
    func loadApple(sceneView:SCNView){
        let apple = SCNScene(named: "Apple.scn")
        appleNode = (apple?.rootNode.childNode(withName: "Apple-1", recursively: true))!
        appleNode.position = SCNVector3(0, 0, 0)
        appleNode.scale = SCNVector3(0.05, 0.05, 0.05)
        sceneView.scene?.rootNode.addChildNode(appleNode)
    }
    
    func moveApple(){
        appleNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        let randomY = Float.random(in: 40..<50)
        let force = SCNVector3(0, randomY, 0)
        let position = SCNVector3(0.5,0.2,0)
        appleNode.physicsBody?.applyForce(force, at: position, asImpulse: true)
    }
}

let space = spaceView()
space.preferredContentSize = CGSize(width: 600, height: 480)
PlaygroundSupport.PlaygroundPage.current.liveView = space
//: [Next](@next)
