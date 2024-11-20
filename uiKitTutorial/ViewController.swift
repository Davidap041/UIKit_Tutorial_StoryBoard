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
        view.backgroundColor = UIColor.lightGray
        
        // MARK: - Views Tutorial
        let drawInCenter = view.center.x - 50
        let myView = UIView(frame: CGRect(x:drawInCenter,y:100,width: 100,height: 100))
        myView.backgroundColor = .magenta
        myView.clipsToBounds = true // clip the sub view
        myView.alpha = 0.5 // opacity attr
        
        // more info about graphics  :https://developer.apple.com/library/archive/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/dq_overview/dq_overview.html
        
        myView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4) // rotate view
        
        // show attr of the view
        print(myView.frame) // frame position
        print(myView.bounds) // frame bounds
        print(myView.center) // center of the frame
        
        // add some subview
        let subView = UIView(frame: CGRect(x:50,y: 50,width: 100,height: 100))
        subView.backgroundColor = .red
        myView.isHidden = false // hide or not the view
        
        // relate view
        myView.addSubview(subView)
        view.addSubview(myView)
        
        // MARK: - Labels Tutorial - sub class of view
        let label = UILabel(frame: CGRect(x: 50, y: 200, width: 200, height: 100))
        label.text = "Hello "
        label.textAlignment = .center
        view.addSubview(label)
        
        //MARK: - Image
    }


}

