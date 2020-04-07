//: [Previous](@previous)
import UIKit
import SceneKit
import PlaygroundSupport

let frame = CGRect(
    x: 0,
    y: 0,
    width: 600,
    height: 480)
let sceneView = SCNView(frame: frame)
sceneView.showsStatistics = true
sceneView.backgroundColor = .black
sceneView.autoenablesDefaultLighting = true
sceneView.allowsCameraControl = true
sceneView.scene = SCNScene()

let cameraNode = SCNNode()
cameraNode.camera = SCNCamera()
cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
sceneView.scene?.rootNode.addChildNode(cameraNode)

let torus = SCNTorus(ringRadius: 1, pipeRadius: 0.25)
torus.firstMaterial?.diffuse.contents = UIColor.systemBlue
torus.firstMaterial?.specular.contents = UIColor.white
let torusNode = SCNNode(geometry: torus)
sceneView.scene?.rootNode.addChildNode(torusNode)

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
//: [Next](@next)
