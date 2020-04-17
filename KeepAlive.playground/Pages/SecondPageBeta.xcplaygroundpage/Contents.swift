//: [Previous](@previous)

import UIKit
import SceneKit
import SceneKit.ModelIO
import PlaygroundSupport

class EndViewController:UIViewController{
    let question = UILabel()
    let backGround = UIImage(named: "endBackGround.png")
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white
        configBackGround(view: view, image: backGround!)
        configLabel(view: view)
        self.view = view
    }
    
    func configBackGround(view:UIView,image:UIImage){
        let backGroundView = UIImageView(image: image)
        view.addSubview(backGroundView)
        backGroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backGroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        backGroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        backGroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
    func configLabel(view:UIView){
        question.text = "It was hard, right? Making the right choice always is. Go to the next page."
        question.backgroundColor = .clear
        question.textColor = .black
        question.textAlignment = .center
        question.numberOfLines = 0
        question.font = question.font.withSize(30)
        view.addSubview(question)
        configLabelConstraints(view: view)
    }

    
    func configLabelConstraints(view:UIView){
        question.translatesAutoresizingMaskIntoConstraints = false
        question.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        question.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        question.heightAnchor.constraint(equalToConstant: 200).isActive = true
        question.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
}


class spaceView:UIViewController,SCNSceneRendererDelegate{
    let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 600, height: 480))
    var timeInterval:TimeInterval = 0
    var stopTime:TimeInterval = 15000
    var numberNode:Int = 0
    var removeNode:[SCNNode] = []
    var textNode = SCNNode()
    var scoreCount:Float = 0.0
    
    override func loadView() {
        sceneView.showsStatistics = true
        sceneView.isPlaying = true
        sceneView.backgroundColor = .white
        sceneView.autoenablesDefaultLighting = true
        sceneView.scene = SCNScene()
        sceneView.allowsCameraControl = false
        sceneView.scene?.physicsWorld.gravity = SCNVector3(0, -10, 0)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapDestroy))
        tapGesture.numberOfTapsRequired = 1
        sceneView.addGestureRecognizer(tapGesture)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y:30, z: 50)
        sceneView.scene?.rootNode.addChildNode(cameraNode)
        sceneView.delegate = self
        
        
        let score = SCNText(string: "score: " + String(scoreCount), extrusionDepth: 1.0)
        score.firstMaterial?.diffuse.contents = UIColor.black
        score.font = UIFont(name: "Arial", size: 4)
        score.alignmentMode = CATextLayerAlignmentMode.center.rawValue
        textNode = SCNNode(geometry: score)
        scorePositioning(sceneView: sceneView)
        sceneView.scene?.rootNode.addChildNode(textNode)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 20, execute: {
            self.sceneView.isPlaying = false
            let end = EndViewController()
            end.modalPresentationStyle = .fullScreen
            end.modalTransitionStyle = .flipHorizontal
            end.preferredContentSize = CGSize(width: 600, height: 480)
            self.present(end, animated: true, completion: nil)
        })
        
        self.view = sceneView
    }
    
    func scorePositioning(sceneView:SCNView){
        textNode.name = "Score"
        textNode.position = SCNVector3(-30, 50, 0)
        textNode.eulerAngles = SCNVector3(x: GLKMathDegreesToRadians(10), y: 0, z: 0)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        
        if time > timeInterval{
            
            let opt = Int.random(in: 0...4)
            if opt == 0{
                let appleNode = loadApple(sceneView: sceneView)
                moveApple(appleNode: appleNode)
            }else if opt == 1{
                let burguerNode = loadHamburguer(sceneView: sceneView)
                moveBurguer(burguerNode: burguerNode)
            }else if opt == 2{
                let vodkaNode = loadVodka(sceneView: sceneView)
                moveVodka(vodkaNode: vodkaNode)
            }else if opt == 3{
                let friesNode = loadFries(sceneView: sceneView)
                moveFries(friesNode: friesNode)
            }else{
                let carrotNode = loadCarrot(sceneView: sceneView)
                moveCarrot(carrotNode: carrotNode)
            }
            timeInterval = time + TimeInterval(exactly: Float.random(in: 2...3))!
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
        let appleNode = (apple?.rootNode.childNode(withName: "Apple", recursively: true))!
        appleNode.position = SCNVector3(Float.random(in: -10..<10), 0, 0)
        //appleNode.name = appleNode.name! + String(numberNode)
        numberNode = numberNode + 1
        sceneView.scene?.rootNode.addChildNode(appleNode)
        return appleNode
    }
    
    func moveApple(appleNode:SCNNode){
        appleNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        appleNode.physicsField?.strength = 0
        let randomY = Float.random(in: 40...60)
        let randomX = Float.random(in: -20..<21)
        let force = SCNVector3(randomX, randomY, 0)
        let position = SCNVector3(0.5,0.2,0)
        appleNode.physicsBody?.applyForce(force, at: position, asImpulse: true)
    }
    
    func loadHamburguer(sceneView:SCNView)->SCNNode{
        let burguer = SCNScene(named: "Burguer.scn")
        let burguerNode = (burguer?.rootNode.childNode(withName: "Burguer", recursively: true))!
        burguerNode.position = SCNVector3(Float.random(in: -10..<10), 0, 0)
        //burguerNode.name = burguerNode.name! + String(numberNode)
        numberNode = numberNode + 1
        sceneView.scene?.rootNode.addChildNode(burguerNode)
        return burguerNode
    }
    
    func moveBurguer(burguerNode:SCNNode){
        burguerNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        burguerNode.physicsField?.strength = 0
        let randomY = Float.random(in: 30...40)
        let randomX = Float.random(in: -20..<21)
        let force = SCNVector3(randomX, randomY, 0)
        let position = SCNVector3(0.5,0.2,0)
        burguerNode.physicsBody?.applyForce(force, at: position, asImpulse: true)
    }
    
    func loadVodka(sceneView:SCNView)->SCNNode{
        let vodka = SCNScene(named: "Vodka.scn")
        let vodkaNode = (vodka?.rootNode.childNode(withName: "Vodka", recursively: true))!
        vodkaNode.position = SCNVector3(Float.random(in: -10..<10), 0, 0)
        //vodkaNode.name = vodkaNode.name! + String(numberNode)
        numberNode = numberNode + 1
        sceneView.scene?.rootNode.addChildNode(vodkaNode)
        return vodkaNode
    }
    
    func moveVodka(vodkaNode:SCNNode){
        vodkaNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        vodkaNode.physicsField?.strength = 0
        let randomY = Float.random(in: 30...40)
        let randomX = Float.random(in: -20..<21)
        let force = SCNVector3(randomX, randomY, 0)
        let position = SCNVector3(0.5,0.2,0)
        vodkaNode.physicsBody?.applyForce(force, at: position, asImpulse: true)
    }
    
    func loadFries(sceneView:SCNView)->SCNNode{
        let fries = SCNScene(named: "Fries.scn")
        let friesNode = (fries?.rootNode.childNode(withName: "Fries", recursively: true))!
        friesNode.position = SCNVector3(Float.random(in: -10..<10), 0, 0)
        //friesNode.name = friesNode.name! + String(numberNode)
        numberNode = numberNode + 1
        sceneView.scene?.rootNode.addChildNode(friesNode)
        return friesNode
    }
    
    func moveFries(friesNode:SCNNode){
        friesNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        friesNode.physicsField?.strength = 0
        let randomY = Float.random(in: 30...40)
        let randomX = Float.random(in: -20..<21)
        let force = SCNVector3(randomX, randomY, 0)
        let position = SCNVector3(0.5,0.2,0)
        friesNode.physicsBody?.applyForce(force, at: position, asImpulse: true)
    }
    
    func loadCarrot(sceneView:SCNView)->SCNNode{
        let carrot = SCNScene(named: "Carrot.scn")
        let carrotNode = (carrot?.rootNode.childNode(withName: "Carrot", recursively: true))!
        carrotNode.position = SCNVector3(Float.random(in: -10..<10), 0, 0)
        //carrotNode.name = carrotNode.name! + String(numberNode)
        numberNode = numberNode + 1
        sceneView.scene?.rootNode.addChildNode(carrotNode)
        return carrotNode
    }
    
    func moveCarrot(carrotNode:SCNNode){
        carrotNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        carrotNode.physicsField?.strength = 0
        let randomY = Float.random(in: 40...60)
        let randomX = Float.random(in: -20..<21)
        let force = SCNVector3(randomX, randomY, 0)
        let position = SCNVector3(0.5,0.2,0)
        carrotNode.physicsBody?.applyForce(force, at: position, asImpulse: true)
    }
    
    
    @IBAction func tapDestroy(recognizer: UITapGestureRecognizer){
        
        let location = recognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(location, options: nil)
        if hitResults.count > 0 {
            let result = hitResults[0]
            let node = result.node
            print(node.name!)
            if node.name! == "Burguer" || node.name! == "Fries" || node.name! == "Vodka"{
                scoreCount -= 10
                node.isHidden = true
            }
        }
    }
}

class TutorialViewController:UIViewController{
    
    let imageBackGround = UIImage(named: "Rectangle 3.png")
    let imageBackGroundShape = UIImage(named: "Rectangle 5.png")
    let howButton = UIButton()
    let label = UILabel()
    let tutorial = UILabel()
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .clear
        configImageBackGround(view: view, imageBackGround: imageBackGround!)
        configImageBackGroundShape(view: view, imageBackGroundShape: imageBackGroundShape!)
        configTutorial(view: view)
        configLabel(view: view)
        configButton(view: view)
        self.view = view
    }
    
    func configTutorial(view:UIView){
        tutorial.text = "It is very very simple, click in the food items that are good for health, make at least 10 points"
        tutorial.backgroundColor = .clear
        tutorial.textColor = .black
        tutorial.textAlignment = .center
        tutorial.numberOfLines = 0
        tutorial.font = tutorial.font.withSize(30)
        view.addSubview(tutorial)
        configTutorialConstraints(view: view)
    }
    
    func configTutorialConstraints(view:UIView){
        tutorial.translatesAutoresizingMaskIntoConstraints = false
        tutorial.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
        tutorial.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        tutorial.heightAnchor.constraint(equalToConstant: 200).isActive = true
        tutorial.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func configButton(view:UIView){
        howButton.backgroundColor = .clear
        howButton.setImage(UIImage(named: "Arrow.png"), for: .normal)
        howButton.addTarget(nil, action: #selector(touchButton), for: .touchUpInside)
        view.addSubview(howButton)
        configButtonConstraints(view: view)
        
    }
    
    func configButtonConstraints(view:UIView){
        howButton.translatesAutoresizingMaskIntoConstraints = false
        howButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        howButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 130).isActive = true
        howButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        howButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func configLabel(view:UIView){
        label.text = "Let's play!"
        label.textColor = .black
        label.backgroundColor = .clear
        label.numberOfLines = 0
        view.addSubview(label)
        configLabelConstraints(view: view)
        
    }
    
    func configLabelConstraints(view:UIView){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 85).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    @IBAction func touchButton(){
        let space = spaceView()
        space.modalPresentationStyle = .fullScreen
        space.modalTransitionStyle = .flipHorizontal
        space.preferredContentSize = CGSize(width: 600, height: 480)
        present(space, animated: true, completion: nil)
    }
    
    func configImageBackGround(view:UIView,imageBackGround:UIImage){
        let imageBackGroundView = UIImageView(image: imageBackGround)
        view.addSubview(imageBackGroundView)
        imageBackGroundView.translatesAutoresizingMaskIntoConstraints = false
        imageBackGroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        imageBackGroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        imageBackGroundView.heightAnchor.constraint(equalToConstant: 480).isActive = true
        imageBackGroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func configImageBackGroundShape(view:UIView, imageBackGroundShape:UIImage){
        let imageBackGroundShapeView = UIImageView(image: imageBackGroundShape)
        view.addSubview(imageBackGroundShapeView)
        imageBackGroundShapeView.translatesAutoresizingMaskIntoConstraints = false
        imageBackGroundShapeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        imageBackGroundShapeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        imageBackGroundShapeView.heightAnchor.constraint(equalToConstant: 360)
        imageBackGroundShapeView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

class IntroViewController : UIViewController {
    
    let imageBackGround = UIImage(named: "Rectangle 3.png")
    let imageBackGroundShape = UIImage(named: "Rectangle 5.png")
    let heartImage = UIImage(named: "LogoHeart.png")
    let howButton = UIButton()
    let label = UILabel()
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white
        configImageBackGround(view: view, imageBackGround: imageBackGround!)
        configImageBackGroundShape(view: view, imageBackGroundShape: imageBackGroundShape!)
        configHeartShape(view: view, heartImage: heartImage!)
        configButton(view: view)
        configLabel(view: view)
        self.view = view
    }
    
    func configButton(view:UIView){
        howButton.backgroundColor = .clear
        howButton.setImage(UIImage(named: "Arrow.png"), for: .normal)
        howButton.addTarget(nil, action: #selector(touchButton), for: .touchUpInside)
        view.addSubview(howButton)
        configButtonConstraints(view: view)
        
    }
    
    func configButtonConstraints(view:UIView){
        howButton.translatesAutoresizingMaskIntoConstraints = false
        howButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        howButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 130).isActive = true
        howButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        howButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func configLabel(view:UIView){
        label.text = "Ready to the challenge!"
        label.textColor = .black
        label.backgroundColor = .clear
        label.numberOfLines = 0
        view.addSubview(label)
        configLabelConstraints(view: view)
        
    }
    
    func configLabelConstraints(view:UIView){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 85).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    @IBAction func touchButton(){
        let tutorial = TutorialViewController()
        tutorial.modalPresentationStyle = .fullScreen
        tutorial.modalTransitionStyle = .flipHorizontal
        tutorial.preferredContentSize = CGSize(width: 600, height: 480)
        present(tutorial, animated: true, completion: nil)
    }
    
    func configImageBackGround(view:UIView,imageBackGround:UIImage){
        let imageBackGroundView = UIImageView(image: imageBackGround)
        view.addSubview(imageBackGroundView)
        imageBackGroundView.translatesAutoresizingMaskIntoConstraints = false
        imageBackGroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        imageBackGroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        imageBackGroundView.heightAnchor.constraint(equalToConstant: 480).isActive = true
        imageBackGroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func configImageBackGroundShape(view:UIView, imageBackGroundShape:UIImage){
        let imageBackGroundShapeView = UIImageView(image: imageBackGroundShape)
        view.addSubview(imageBackGroundShapeView)
        imageBackGroundShapeView.translatesAutoresizingMaskIntoConstraints = false
        imageBackGroundShapeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        imageBackGroundShapeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        imageBackGroundShapeView.heightAnchor.constraint(equalToConstant: 360)
        imageBackGroundShapeView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func configHeartShape(view:UIView, heartImage:UIImage){
        let heartImageView = UIImageView(image: heartImage)
        view.addSubview(heartImageView)
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        heartImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        heartImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        heartImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        heartImageView.widthAnchor.constraint(equalToConstant: 278.45).isActive = true
        heartImageView.heightAnchor.constraint(equalToConstant: 252.75).isActive = true
    }
    
}
PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true
let intro = IntroViewController()
intro.preferredContentSize = CGSize(width: 600, height: 480)
//let game = spaceView()
//game.preferredContentSize = CGSize(width: 600, height: 480)

PlaygroundSupport.PlaygroundPage.current.liveView = intro
//: [Next](@next)
