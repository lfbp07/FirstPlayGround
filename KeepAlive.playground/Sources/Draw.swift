import UIKit
import SceneKit
import SceneKit.ModelIO
import PlaygroundSupport

public class Draw{
    
    public init(){}
    
    public func drawStomachCircle(sceneNode:SCNNode){
        let circleStomach = SCNSphere(radius: 1)
        circleStomach.firstMaterial?.diffuse.contents = UIColor.red
        circleStomach.firstMaterial?.specular.contents = UIColor.white
        circleStomach.firstMaterial?.transparency = 0
        let circleStomachNode = SCNNode(geometry: circleStomach)
        circleStomachNode.position.z = 0
        circleStomachNode.position.y = 0
        circleStomachNode.position.x = 0
        sceneNode.addChildNode(circleStomachNode)
    }
    
    public func drawHeadCircle(sceneNode:SCNNode){
        let circleHead = SCNSphere(radius: 10)
        circleHead.firstMaterial?.diffuse.contents = UIColor.red
        circleHead.firstMaterial?.specular.contents = UIColor.white
        circleHead.firstMaterial?.transparency = 0.3
        let circleHeadNode = SCNNode(geometry: circleHead)
        circleHeadNode.position.z = 10
        circleHeadNode.position.y = 100
        circleHeadNode.position.x = 0
        sceneNode.addChildNode(circleHeadNode)
    }
    
    public func loadBodyModel(sceneView:SCNView)->SCNNode{
        guard let url = Bundle.main.url(forResource: "untitled", withExtension: "obj") else { fatalError("Failed to find model file.")}
        let asset = MDLAsset(url:url)
        guard let object = asset.object(at: 0) as? MDLMesh
             else { fatalError("Failed to get mesh from asset.") }
        let bodyNode  = SCNNode(mdlObject: object)
        bodyNode.scale = SCNVector3(x: 0.02, y: 0.02, z: 0.02)
        bodyNode.position = SCNVector3(0, -1.6, 0)
        sceneView.scene?.rootNode.addChildNode(bodyNode)
        return bodyNode
    }

}
