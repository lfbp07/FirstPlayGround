//: [Previous](@previous)

import UIKit
import PlaygroundSupport

class ThirdViewController : UIViewController {
        
    let imageBackGround = UIImage(named: "Rectangle 3.png")
    let imageBackGroundShape = UIImage(named: "Rectangle 5.png")
    let heartImage = UIImage(named: "HeartThree.png")
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white
        configImageBackGround(view: view, imageBackGround: imageBackGround!)
        configImageBackGroundShape(view: view, imageBackGroundShape: imageBackGroundShape!)
        configHeartShape(view: view, heartImage: heartImage!)
        self.view = view
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

class SecondViewController : UIViewController {
        
    let imageBackGround = UIImage(named: "Rectangle 3.png")
    let imageBackGroundShape = UIImage(named: "Rectangle 5.png")
    let heartImage = UIImage(named: "HeartTwo.png")
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
    
    func configLabel(view:UIView){
        label.text = "and 3º..."
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
           let ThirdView = ThirdViewController()
           ThirdView.modalPresentationStyle = .fullScreen
           ThirdView.modalTransitionStyle = .flipHorizontal
           ThirdView.preferredContentSize = CGSize(width: 600, height: 480)
           present(ThirdView, animated: true, completion: nil)
        
       }

}

class FirstViewController : UIViewController {
        
    let imageBackGround = UIImage(named: "Rectangle 3.png")
    let imageBackGroundShape = UIImage(named: "Rectangle 5.png")
    let heartImage = UIImage(named: "HeartOne.png")
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
    
    func configLabel(view:UIView){
        label.text = "Which is..."
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
           let SecondView = SecondViewController()
           SecondView.modalPresentationStyle = .fullScreen
           SecondView.modalTransitionStyle = .flipHorizontal
           SecondView.preferredContentSize = CGSize(width: 600, height: 480)
           present(SecondView, animated: true, completion: nil)
            print("pressed")
       }

}

let FirstView = FirstViewController()
FirstView.preferredContentSize = CGSize(width: 600, height: 480)
PlaygroundPage.current.liveView = FirstView
//: [Next](@next)
