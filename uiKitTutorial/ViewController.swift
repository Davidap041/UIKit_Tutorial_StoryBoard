//
//  ViewController.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 20/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var blueView: UIView!
    var offset:CGPoint?
    
    // empty project
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.isUserInteractionEnabled = true
        // view.isMultipleTouchEnabled = true
        
    }
    
    // MARK: - Touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touch = touches.first!
        
        // get offset touch location
        if touch.view == blueView{
            let location = touch.location(in: blueView)
            offset = location
            return
        }
        
        let location = touch.location(in: view)
        print("touches began \(location)")
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let touch = touches.first!
        let location = touch.location(in: view)
        
        guard let offset = offset else{
            return
        }
        
        if touch.view == blueView{
            blueView.frame.origin.x = location.x - offset.x
            blueView.frame.origin.y = location.y - offset.y
        }
        
        
        print("touches moved \(location)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        let touch = touches.first!
        let location = touch.location(in: view)
        print("touches ended \(location)")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches cancelled")
    }
}
