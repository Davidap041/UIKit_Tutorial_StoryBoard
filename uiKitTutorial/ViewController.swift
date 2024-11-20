//
//  ViewController.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 20/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        // create button without storyboard
        let button = UIButton(type: .system)
        button.setTitle("Push me", for: .normal)
        button.setTitle("Pushed", for: .highlighted)
        button.frame = CGRect(x:20,y: 20,width: 200,height: 100)
        button.addTarget(self, action: #selector(doAnotherThing), for: .touchUpInside)
        view.addSubview(button)
        
    }

    @objc func doAnotherThing(_button:UIButton){
        print("Pushed")
    }
    
    @IBAction func doSomething(_ sender: Any) {
        print("Hello")
    }
    
    @IBAction func touchDown(_ sender: Any){ // Any can be chaged for UIComponents
        print("Button Down")
    }
    
    @IBAction func sliderChanged(_ slider: UISlider) {
        print("Value Changed \(slider.value)")
    }
    
}

