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
        view.backgroundColor = UIColor.blue
        let myView = UIView(frame: CGRect(x:50,y:50,width: 100,height: 100))
        myView.backgroundColor = .magenta
        
        view.addSubview(myView)
    }


}

