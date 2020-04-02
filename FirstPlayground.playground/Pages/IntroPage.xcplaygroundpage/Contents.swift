import UIKit
import PlaygroundSupport

class SecondeViewController:UIViewController{
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
    }
}

class FirstViewController : UIViewController {
        
    let text = UILabel()
    let imageBackGround = UIImage(named: "Rectangle 3.png")
    let imageBackGroundShape = UIImage(named: "Rectangle 5.png")
    let heartImage = UIImage(named: "heart.png")
    let howButton = UIButton()
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white
        configImageBackGround(view: view, imageBackGround: imageBackGround!)
        configImageBackGroundShape(view: view, imageBackGroundShape: imageBackGroundShape!)
        configHeartShape(view: view, heartImage: heartImage!)
        configButton(view: view)
        self.view = view
    }
    
    func configButton(view:UIView){
        howButton.setTitle("But how!?", for: .normal)
        howButton.setTitleColor(.white, for: .normal)
        howButton.backgroundColor = .black
        howButton.layer.cornerRadius = 20
        howButton.addTarget(nil, action: #selector(touchButton), for: .touchUpInside)
        view.addSubview(howButton)
        configButtonConstraints(view: view)
        
    }
    
    func configButtonConstraints(view:UIView){
        howButton.translatesAutoresizingMaskIntoConstraints = false
        howButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200).isActive = true
        howButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200).isActive = true
        howButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        howButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -20).isActive = true
    }
    
    @IBAction func touchButton(){
        print("button touched!")
        let SecondView = SecondeViewController()
        SecondView.modalPresentationStyle = .fullScreen
        show(SecondView, sender: nil)
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
    }

}

// Present the view controller in the Live View window
let FirstView = FirstViewController()
FirstView.preferredContentSize = CGSize(width: 700, height: 480)
PlaygroundPage.current.liveView = FirstView
