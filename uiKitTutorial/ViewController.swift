//
//  ViewController.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 20/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var blueView: UIView!
      
    // empty project
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned))
        
        blueView.addGestureRecognizer(panGesture)
    }
    
    @objc func panned(_ gesture: UIPanGestureRecognizer){
        // print("panned")
        
        let translation = gesture.translation(in: blueView)
        
        blueView.frame.origin.x += translation.x
        blueView.frame.origin.y += translation.y
        
        gesture.setTranslation(.zero, in: blueView)
    }
}
