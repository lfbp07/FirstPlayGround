//: [Next](@next)
import UIKit
import PlaygroundSupport

class FifthViewController:UIViewController{
    let question = UILabel()
    let backGround = UIImage(named: "backGround_1.png")
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
        question.text = "Man, we have a big problem and I will prove it! Go to the next page."
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

class FourthViewController:UIViewController{
    
    let question = UILabel()
    let buttonOption_0 = UIButton()
    let buttonOption_1 = UIButton()
    let buttonOption_2 = UIButton()
    let backGround = UIImage(named: "backGround_1.png")
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        configBackGround(view: view, image: backGround!)
        buttonOption_0.setTitle("Yes, pretty fast", for: .normal)
        buttonOption_1.setTitle("Yes", for: .normal)
        buttonOption_2.setTitle("Also yes", for: .normal)
        configButtonConstraints(view: view, button: buttonOption_0,shift: -160)
        configButtonConstraints(view: view, button: buttonOption_1, shift: 0)
        configButtonConstraints(view: view, button: buttonOption_2, shift: 160)
        
        buttonOption_0.addTarget(nil, action: #selector(touchButtonOpt_0), for: .touchUpInside)
        buttonOption_1.addTarget(nil, action: #selector(touchButtonOpt_1), for: .touchUpInside)
        buttonOption_2.addTarget(nil, action: #selector(touchButtonOpt_2), for: .touchUpInside)
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
        question.text = "Are you dying?"
        question.backgroundColor = .clear
        question.textColor = .black
        question.textAlignment = .center
        question.numberOfLines = 0
        question.font = question.font.withSize(30)
        view.addSubview(question)
        configLabelConstraints(view: view)
    }
    
    @IBAction func touchButtonOpt_0(){
        self.buttonOption_0.isEnabled = false
        self.buttonOption_1.isEnabled = false
        self.buttonOption_2.isEnabled = false
        self.question.isEnabled = false
        UIView.animate(withDuration: 0.5, animations:{
            self.buttonOption_0.alpha = 0
            self.buttonOption_1.alpha = 0
            self.buttonOption_2.alpha = 0
            self.question.alpha = 0
        })
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1, execute: {
            self.question.text = "Stay calm, we all are..."
            UIView.animate(withDuration: 1, animations: {self.question.alpha = 1
                self.question.isEnabled = true
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = false
                    self.question.alpha = 0})
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5, execute:{
                let FifthView = FifthViewController()
                FifthView.modalPresentationStyle = .fullScreen
                FifthView.modalTransitionStyle = .flipHorizontal
                FifthView.preferredContentSize = CGSize(width: 600, height: 480)
                self.present(FifthView, animated: true, completion: nil)

            })
        })
    }
    
    @IBAction func touchButtonOpt_1(){
        self.buttonOption_0.isEnabled = false
        self.buttonOption_1.isEnabled = false
        self.buttonOption_2.isEnabled = false
        self.question.isEnabled = false
        UIView.animate(withDuration: 0.5, animations:{
            self.buttonOption_0.alpha = 0
            self.buttonOption_1.alpha = 0
            self.buttonOption_2.alpha = 0
            self.question.alpha = 0
        })
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1, execute: {
            self.question.text = "As expected."
            UIView.animate(withDuration: 1, animations: {self.question.alpha = 1
                self.question.isEnabled = true
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = false
                    self.question.alpha = 0})
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5, execute:{
                let FifthView = FifthViewController()
                FifthView.modalPresentationStyle = .fullScreen
                FifthView.modalTransitionStyle = .flipHorizontal
                FifthView.preferredContentSize = CGSize(width: 600, height: 480)
                self.present(FifthView, animated: true, completion: nil)

            })

        })
    }
    
    @IBAction func touchButtonOpt_2(){
        self.buttonOption_0.isEnabled = false
        self.buttonOption_1.isEnabled = false
        self.buttonOption_2.isEnabled = false
        self.question.isEnabled = false
        UIView.animate(withDuration: 0.5, animations:{
            self.buttonOption_0.alpha = 0
            self.buttonOption_1.alpha = 0
            self.buttonOption_2.alpha = 0
            self.question.alpha = 0
        })
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1, execute: {
            self.question.text = "You have no choice..."
            UIView.animate(withDuration: 1, animations: {self.question.alpha = 1
                self.question.isEnabled = true
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = false
                    self.question.alpha = 0})
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5, execute:{
                let FifthView = FifthViewController()
                FifthView.modalPresentationStyle = .fullScreen
                FifthView.modalTransitionStyle = .flipHorizontal
                FifthView.preferredContentSize = CGSize(width: 600, height: 480)
                self.present(FifthView, animated: true, completion: nil)

            })
        })
    }
    
    func configLabelConstraints(view:UIView){
        question.translatesAutoresizingMaskIntoConstraints = false
        question.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        question.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        question.heightAnchor.constraint(equalToConstant: 200).isActive = true
        question.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func configButtonConstraints(view:UIView, button:UIButton,shift:CGFloat){
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .white
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: shift).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

class ThirdViewController:UIViewController{
    let question = UILabel()
    let buttonOption_0 = UIButton()
    let buttonOption_1 = UIButton()
    let buttonOption_2 = UIButton()
    let backGround = UIImage(named: "backGround_1.png")
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        configBackGround(view: view, image: backGround!)
        buttonOption_0.setTitle("A lot", for: .normal)
        buttonOption_1.setTitle("More or less", for: .normal)
        buttonOption_2.setTitle("Exercise?", for: .normal)
        configButtonConstraints(view: view, button: buttonOption_0,shift: -160)
        configButtonConstraints(view: view, button: buttonOption_1, shift: 0)
        configButtonConstraints(view: view, button: buttonOption_2, shift: 160)
        
        buttonOption_0.addTarget(nil, action: #selector(touchButtonOpt_0), for: .touchUpInside)
        buttonOption_1.addTarget(nil, action: #selector(touchButtonOpt_1), for: .touchUpInside)
        buttonOption_2.addTarget(nil, action: #selector(touchButtonOpt_2), for: .touchUpInside)
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
        question.text = "How much exercise there is in your life?"
        question.backgroundColor = .clear
        question.textColor = .black
        question.textAlignment = .center
        question.numberOfLines = 0
        question.font = question.font.withSize(30)
        view.addSubview(question)
        configLabelConstraints(view: view)
    }
    
    @IBAction func touchButtonOpt_0(){
        self.buttonOption_0.isEnabled = false
        self.buttonOption_1.isEnabled = false
        self.buttonOption_2.isEnabled = false
        self.question.isEnabled = false
        UIView.animate(withDuration: 0.5, animations:{
            self.buttonOption_0.alpha = 0
            self.buttonOption_1.alpha = 0
            self.buttonOption_2.alpha = 0
            self.question.alpha = 0
        })
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1, execute: {
            self.question.text = "A lot? Are you kidding?"
            UIView.animate(withDuration: 1, animations: {self.question.alpha = 1
                self.question.isEnabled = true
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = false
                    self.question.alpha = 0})
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = false
                    self.question.alpha = 0})
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5, execute:{
                self.question.text = "I know it is not a lot..."
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = true
                    self.question.alpha = 1
                })
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.5, execute: {
                UIView.animate(withDuration: 0.5, animations:{
                    self.question.isEnabled = false
                    self.question.alpha = 0
                })
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.5, execute: {
                self.question.text = "How much exercise there is in your life?"
                self.buttonOption_0.isEnabled = true
                self.buttonOption_1.isEnabled = true
                self.buttonOption_2.isEnabled = true
                self.question.isEnabled = true
                UIView.animate(withDuration: 0.5, animations:{
                    self.buttonOption_0.alpha = 1
                    self.buttonOption_1.alpha = 1
                    self.buttonOption_2.alpha = 1
                    self.question.alpha = 1
                })
            })
        })
    }
    
    @IBAction func touchButtonOpt_1(){
        self.buttonOption_0.isEnabled = false
        self.buttonOption_1.isEnabled = false
        self.buttonOption_2.isEnabled = false
        self.question.isEnabled = false
        UIView.animate(withDuration: 0.5, animations:{
            self.buttonOption_0.alpha = 0
            self.buttonOption_1.alpha = 0
            self.buttonOption_2.alpha = 0
            self.question.alpha = 0
        })
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1, execute: {
            self.question.text = "Almost there, a little more sincerity."
            UIView.animate(withDuration: 1, animations: {self.question.alpha = 1
                self.question.isEnabled = true
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = false
                    self.question.alpha = 0})
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = false
                    self.question.alpha = 0})
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5, execute:{
                self.question.text = "Come on..."
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = true
                    self.question.alpha = 1
                })
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.5, execute: {
                UIView.animate(withDuration: 0.5, animations:{
                    self.question.isEnabled = false
                    self.question.alpha = 0
                })
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.5, execute: {
                self.question.text = "How much exercise there is in your life?"
                self.buttonOption_0.isEnabled = true
                self.buttonOption_1.isEnabled = true
                self.buttonOption_2.isEnabled = true
                self.question.isEnabled = true
                UIView.animate(withDuration: 0.5, animations:{
                    self.buttonOption_0.alpha = 1
                    self.buttonOption_1.alpha = 1
                    self.buttonOption_2.alpha = 1
                    self.question.alpha = 1
                })
            })

        })
    }
    
    @IBAction func touchButtonOpt_2(){
        self.buttonOption_0.isEnabled = false
        self.buttonOption_1.isEnabled = false
        self.buttonOption_2.isEnabled = false
        self.question.isEnabled = false
        UIView.animate(withDuration: 0.5, animations:{
            self.buttonOption_0.alpha = 0
            self.buttonOption_1.alpha = 0
            self.buttonOption_2.alpha = 0
            self.question.alpha = 0
        })
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1, execute: {
            self.question.text = "Yes, here we go..."
            UIView.animate(withDuration: 1, animations: {self.question.alpha = 1
                self.question.isEnabled = true
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = false
                    self.question.alpha = 0})
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5, execute:{
                let FourthView = FourthViewController()
                FourthView.modalPresentationStyle = .fullScreen
                FourthView.modalTransitionStyle = .flipHorizontal
                FourthView.preferredContentSize = CGSize(width: 600, height: 480)
                self.present(FourthView, animated: true, completion: nil)

            })
        })
    }
    
    func configLabelConstraints(view:UIView){
        question.translatesAutoresizingMaskIntoConstraints = false
        question.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        question.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        question.heightAnchor.constraint(equalToConstant: 200).isActive = true
        question.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func configButtonConstraints(view:UIView, button:UIButton,shift:CGFloat){
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .white
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: shift).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

class SecondeViewController:UIViewController{
    
    let question = UILabel()
    let buttonOption_0 = UIButton()
    let buttonOption_1 = UIButton()
    let buttonOption_2 = UIButton()
    let backGround = UIImage(named: "backGround_1.png")
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        configBackGround(view: view, image: backGround!)
        buttonOption_0.setTitle("3 months max", for: .normal)
        buttonOption_1.setTitle("6 months max", for: .normal)
        buttonOption_2.setTitle("Do not remember", for: .normal)
        configButtonConstraints(view: view, button: buttonOption_0,shift: -160)
        configButtonConstraints(view: view, button: buttonOption_1, shift: 0)
        configButtonConstraints(view: view, button: buttonOption_2, shift: 160)
        
        buttonOption_0.addTarget(nil, action: #selector(touchButtonOpt_0), for: .touchUpInside)
        buttonOption_1.addTarget(nil, action: #selector(touchButtonOpt_1), for: .touchUpInside)
        buttonOption_2.addTarget(nil, action: #selector(touchButtonOpt_2), for: .touchUpInside)
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
        question.text = "When was the last time you went to the doctor?"
        question.backgroundColor = .clear
        question.textColor = .black
        question.textAlignment = .center
        question.numberOfLines = 0
        question.font = question.font.withSize(30)
        view.addSubview(question)
        configLabelConstraints(view: view)
    }
    
    @IBAction func touchButtonOpt_0(){
        self.buttonOption_0.isEnabled = false
        self.buttonOption_1.isEnabled = false
        self.buttonOption_2.isEnabled = false
        self.question.isEnabled = false
        UIView.animate(withDuration: 0.5, animations:{
            self.buttonOption_0.alpha = 0
            self.buttonOption_1.alpha = 0
            self.buttonOption_2.alpha = 0
            self.question.alpha = 0
        })
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1, execute: {
            self.question.text = "Hey! Don't you lie to me! I can smell it!"
            UIView.animate(withDuration: 1, animations: {self.question.alpha = 1
                self.question.isEnabled = true
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = false
                    self.question.alpha = 0})
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5, execute:{
                self.question.text = "Let's try again..."
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = true
                    self.question.alpha = 1
                })
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.5, execute: {
                UIView.animate(withDuration: 0.5, animations:{
                    self.question.isEnabled = false
                    self.question.alpha = 0
                })
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.5, execute: {
                self.question.text = "When was the last time you went to the doctor?"
                self.buttonOption_0.isEnabled = true
                self.buttonOption_1.isEnabled = true
                self.buttonOption_2.isEnabled = true
                self.question.isEnabled = true
                UIView.animate(withDuration: 0.5, animations:{
                    self.buttonOption_0.alpha = 1
                    self.buttonOption_1.alpha = 1
                    self.buttonOption_2.alpha = 1
                    self.question.alpha = 1
                })
            })
        })
    }
    
    @IBAction func touchButtonOpt_1(){
        self.buttonOption_0.isEnabled = false
        self.buttonOption_1.isEnabled = false
        self.buttonOption_2.isEnabled = false
        self.question.isEnabled = false
        UIView.animate(withDuration: 0.5, animations:{
            self.buttonOption_0.alpha = 0
            self.buttonOption_1.alpha = 0
            self.buttonOption_2.alpha = 0
            self.question.alpha = 0
        })
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1, execute: {
            self.question.text = "Hum...Really!?"
            UIView.animate(withDuration: 1, animations: {self.question.alpha = 1
                self.question.isEnabled = true
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = false
                    self.question.alpha = 0})
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5, execute:{
                self.question.text = "Almost, one more chance ..."
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = true
                    self.question.alpha = 1
                })
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.5, execute: {
                UIView.animate(withDuration: 0.5, animations:{
                    self.question.isEnabled = false
                    self.question.alpha = 0
                })
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.5, execute: {
                self.question.text = "When was the last time you went to the doctor?"
                self.buttonOption_0.isEnabled = true
                self.buttonOption_1.isEnabled = true
                self.buttonOption_2.isEnabled = true
                self.question.isEnabled = true
                UIView.animate(withDuration: 0.5, animations:{
                    self.buttonOption_0.alpha = 1
                    self.buttonOption_1.alpha = 1
                    self.buttonOption_2.alpha = 1
                    self.question.alpha = 1
                })
            })

        })
    }
    
    @IBAction func touchButtonOpt_2(){
        self.buttonOption_0.isEnabled = false
        self.buttonOption_1.isEnabled = false
        self.buttonOption_2.isEnabled = false
        self.question.isEnabled = false
        UIView.animate(withDuration: 0.5, animations:{
            self.buttonOption_0.alpha = 0
            self.buttonOption_1.alpha = 0
            self.buttonOption_2.alpha = 0
            self.question.alpha = 0
        })
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1, execute: {
            self.question.text = "Seems right..."
            UIView.animate(withDuration: 1, animations: {self.question.alpha = 1
                self.question.isEnabled = true
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.question.isEnabled = false
                    self.question.alpha = 0})
            })
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5, execute:{
                let ThirdView = ThirdViewController()
                ThirdView.modalPresentationStyle = .fullScreen
                ThirdView.modalTransitionStyle = .flipHorizontal
                ThirdView.preferredContentSize = CGSize(width: 600, height: 480)
                self.present(ThirdView, animated: true, completion: nil)

            })

        })
    }
    
    func configLabelConstraints(view:UIView){
        question.translatesAutoresizingMaskIntoConstraints = false
        question.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        question.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        question.heightAnchor.constraint(equalToConstant: 200).isActive = true
        question.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func configButtonConstraints(view:UIView, button:UIButton,shift:CGFloat){
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .white
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: shift).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
}

class FirstViewController : UIViewController {
        
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
        label.text = "Let's find out if you can make it!"
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
        let SecondView = SecondeViewController()
        SecondView.modalPresentationStyle = .fullScreen
        SecondView.modalTransitionStyle = .flipHorizontal
        SecondView.preferredContentSize = CGSize(width: 600, height: 480)
        present(SecondView, animated: true, completion: nil)
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
let FirstView = FirstViewController()
FirstView.preferredContentSize = CGSize(width: 600, height: 480)
PlaygroundPage.current.liveView = FirstView
