import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    
    let button = UIButton()
    let label = UILabel()
    let rect3 = UIImage(named: "Rectangle 3.png")
    let rect3View = UIImageView(image:)
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        button.frame = CGRect(x: 150, y: 220, width: 200, height: 40)
        button.setTitle("Toque", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        view.addSubview(label)
        view.addSubview(button)
        self.view = view
    }
    
    // ainda podemos usar viewDidLoad
    override func viewDidLoad() {
        button.addTarget(self, action: #selector(MyViewController.touchedButton), for: .touchUpInside)
    }
    
    @IBAction func touchedButton() {
        print("oi")
    }

}
// Present the view controller in the Live View window
let mvc = MyViewController()
mvc.preferredContentSize = CGSize(width: 640, height: 480)
PlaygroundPage.current.liveView = mvc
