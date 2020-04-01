import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
        
    let text = UILabel()
    let textBox = UIImage(named:"Rectangle 1.png")
    let imageBackGround = UIImage(named: "Rectangle 3.png")
    let imageBackGroundShape = UIImage(named: "Rectangle 5.png")
    let health = UIImage(named: "health 1.png")
    override func loadView() {
        
        let healthView = UIImageView(image: health)
        
        healthView.frame = CGRect(x: 200, y: 90, width: 324, height: 308)
        
        let view = UIView()
        view.backgroundColor = .white
        
        
        //view.addSubview(healthView)
        configImageBackGround(view: view, imageBackGround: imageBackGround!)
        configImageBackGroundShape(view: view, imageBackGroundShape: imageBackGroundShape!)
        self.view = view
    }
    
    func configText(view:UIView){
        text.text = "Your mama want you to KeepAlive!!!"
        text.textColor = .black
        text.numberOfLines = 0
        text.backgroundColor = .cyan
        text.alpha = 0.8
        view.addSubview(text)
        configTextConstraints(view: view)
    }
    
    func configTextConstraints(view:UIView){
        text.translatesAutoresizingMaskIntoConstraints = false
        text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -400).isActive = true
        text.heightAnchor.constraint(equalToConstant: 480).isActive = true
        text.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 0).isActive = true
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
// Present the view controller in the Live View window
let mvc = MyViewController()
mvc.preferredContentSize = CGSize(width: 640, height: 480)
PlaygroundPage.current.liveView = mvc
