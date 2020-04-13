//: [Previous](@previous)
/*:
    The human body at yours 20's
 */
import UIKit
import SceneKit
import SceneKit.ModelIO
import PlaygroundSupport

class spaceView:UIViewController{
    
    let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 600, height: 480))
    var bodyNode = SCNNode()
    var textNode = SCNNode()
    override func loadView() {

        sceneView.showsStatistics = true
        sceneView.backgroundColor = .black
        sceneView.autoenablesDefaultLighting = true
        sceneView.scene = SCNScene()
        sceneView.allowsCameraControl = true
        
        let tapRec = UITapGestureRecognizer(target: self, action: #selector(tapRecognizer))
        tapRec.numberOfTapsRequired = 1
        sceneView.addGestureRecognizer(tapRec)

        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
        sceneView.scene?.rootNode.addChildNode(cameraNode)
        
        let geoText = SCNText(string: "Age: 20's", extrusionDepth: 1.0)
        geoText.firstMaterial?.diffuse.contents = UIColor.white
        textNode = SCNNode(geometry: geoText)
        textNode.scale = SCNVector3(0.03, 0.03, 0.03)
        textNode.position = SCNVector3(-3.2, 2.2, 0)
        sceneView.scene?.rootNode.addChildNode(textNode)

        
        let drawHandler = Draw()
        bodyNode = drawHandler.loadBodyModel(sceneView: sceneView)
        drawHandler.drawHeadCircle(sceneNode: bodyNode)
        self.view = sceneView
    
    }
    
    @objc func tapRecognizer(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: sceneView)
        if(location.x > location.y && location.x > 600-600/4){
            print("entrou")
            bodyNode.eulerAngles = SCNVector3(0, GLKMathDegreesToRadians(90)+bodyNode.eulerAngles.y, 0)
            if(bodyNode.eulerAngles.y>=2*3.1414){
                bodyNode.eulerAngles = SCNVector3(0,0, 0)
            }
        }else if(location.x < location.y && location.x<600/4){
            print("entrou")
            bodyNode.eulerAngles = SCNVector3(0, GLKMathDegreesToRadians(-90)+bodyNode.eulerAngles.y, 0)
            if(bodyNode.eulerAngles.y <= -2*3.1414){
                bodyNode.eulerAngles = SCNVector3(0,0, 0)
            }
        }
    }
    
}
let space = spaceView()
space.preferredContentSize = CGSize(width: 600, height: 480)
PlaygroundSupport.PlaygroundPage.current.liveView = space
//: [Next](@next)
