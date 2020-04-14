//: [Previous](@previous)

import UIKit
import SceneKit
import SceneKit.ModelIO
import PlaygroundSupport

class spaceView:UIViewController,SCNSceneRendererDelegate{
    let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 600, height: 480))
    var timeInterval:TimeInterval = 0
    override func loadView() {
        sceneView.showsStatistics = true
        sceneView.backgroundColor = .white
        sceneView.autoenablesDefaultLighting = true
        sceneView.scene = SCNScene()
        sceneView.allowsCameraControl = false
        sceneView.scene?.physicsWorld.gravity = SCNVector3(0, -20, 0)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapDestroy))
        tapGesture.numberOfTapsRequired = 1
        sceneView.addGestureRecognizer(tapGesture)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y:30, z: 50)
        sceneView.scene?.rootNode.addChildNode(cameraNode)
        sceneView.delegate = self
        self.view = sceneView
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        
        if time > timeInterval{
            
            let opt = Int.random(in: 0..<4)
            if opt == 0{
                let appleNode = loadApple(sceneView: sceneView)
                moveApple(appleNode: appleNode)
            }else if opt == 1{
                let burguerNode = loadHamburguer(sceneView: sceneView)
                moveBurguer(burguerNode: burguerNode)
            }else if opt == 2{
                let vodkaNode = loadVodka(sceneView: sceneView)
                moveVodka(vodkaNode: vodkaNode)
            }else{
                let friesNode = loadFries(sceneView: sceneView)
                moveFries(friesNode: friesNode)
            }
            timeInterval = time + TimeInterval(exactly: Float.random(in: 1.5..<2))!
        }
        cleanScene(sceneView: sceneView)
    }
    
    func cleanScene(sceneView:SCNView) {

        for node in (sceneView.scene?.rootNode.childNodes)! {
    
        if node.presentation.position.y < 0 {
          node.removeFromParentNode()
        }
      }
    }
    
    func loadApple(sceneView:SCNView)->SCNNode{
        let apple = SCNScene(named: "Apple.scn")
        let appleNode = (apple?.rootNode.childNode(withName: "Apple-1", recursively: true))!
        appleNode.position = SCNVector3(Float.random(in: -10..<10), 0, 0)
        sceneView.scene?.rootNode.addChildNode(appleNode)
        return appleNode
    }
    
    func moveApple(appleNode:SCNNode){
        appleNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        appleNode.physicsField?.strength = 0
        let randomY = Float.random(in: 40..<50)
        let randomX = Float.random(in: -20..<21)
        let force = SCNVector3(randomX, randomY, 0)
        let position = SCNVector3(0.5,0.2,0)
        appleNode.physicsBody?.applyForce(force, at: position, asImpulse: true)
    }
    
    func loadHamburguer(sceneView:SCNView)->SCNNode{
        let burguer = SCNScene(named: "Burguer.scn")
        let burguerNode = (burguer?.rootNode.childNode(withName: "Burguer", recursively: true))!
        burguerNode.position = SCNVector3(Float.random(in: -10..<10), 0, 0)
        sceneView.scene?.rootNode.addChildNode(burguerNode)
        return burguerNode
    }
    
    func moveBurguer(burguerNode:SCNNode){
        burguerNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        burguerNode.physicsField?.strength = 0
        let randomY = Float.random(in: 40..<50)
        let randomX = Float.random(in: -20..<21)
        let force = SCNVector3(randomX, randomY, 0)
        let position = SCNVector3(0.5,0.2,0)
        burguerNode.physicsBody?.applyForce(force, at: position, asImpulse: true)
    }
    
    func loadVodka(sceneView:SCNView)->SCNNode{
        let vodka = SCNScene(named: "Vodka.scn")
        let vodkaNode = (vodka?.rootNode.childNode(withName: "Vodka", recursively: true))!
        vodkaNode.position = SCNVector3(Float.random(in: -10..<10), 0, 0)
        sceneView.scene?.rootNode.addChildNode(vodkaNode)
        return vodkaNode
    }
    
    func moveVodka(vodkaNode:SCNNode){
        vodkaNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        vodkaNode.physicsField?.strength = 0
        let randomY = Float.random(in: 40..<50)
        let randomX = Float.random(in: -20..<21)
        let force = SCNVector3(randomX, randomY, 0)
        let position = SCNVector3(0.5,0.2,0)
        vodkaNode.physicsBody?.applyForce(force, at: position, asImpulse: true)
    }
    
    func loadFries(sceneView:SCNView)->SCNNode{
        let fries = SCNScene(named: "Fries.scn")
        let friesNode = (fries?.rootNode.childNode(withName: "Fries", recursively: true))!
        friesNode.position = SCNVector3(Float.random(in: -10..<10), 0, 0)
        sceneView.scene?.rootNode.addChildNode(friesNode)
        return friesNode
    }
    
    func moveFries(friesNode:SCNNode){
        friesNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        friesNode.physicsField?.strength = 0
        let randomY = Float.random(in: 40..<50)
        let randomX = Float.random(in: -20..<21)
        let force = SCNVector3(randomX, randomY, 0)
        let position = SCNVector3(0.5,0.2,0)
        friesNode.physicsBody?.applyForce(force, at: position, asImpulse: true)
    }

    @IBAction func tapDestroy(recognizer: UITapGestureRecognizer){

        let location = recognizer.location(in: sceneView)
            
        let hitResults = sceneView.hitTest(location, options: nil)
        if hitResults.count > 0 {
            let result = hitResults[0]
            let node = result.node
            print(node.name!)
            node.removeFromParentNode()
           }
    }
}

let space = spaceView()
space.preferredContentSize = CGSize(width: 600, height: 480)
PlaygroundSupport.PlaygroundPage.current.liveView = space
//: [Next](@next)
