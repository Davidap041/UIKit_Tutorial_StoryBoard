//
//  ViewController.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 20/11/24.
//

import UIKit

class ViewController: UIViewController {
    // empty project
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        
    }

    @IBAction func showPink(_ sender: Any) {
        let vc = ColorViewController()
        vc.set(color: UIColor.systemPink, name: "Pink")
        vc.modalPresentationStyle = .fullScreen
        // vc.modalTransitionStyle = .crossDissolve
        present(vc,animated: true,completion: nil)
    }
    
    @IBAction func showOrange(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "colorVC")
        as? Color2ViewController else{
            return
        }
        
        vc.set(color: UIColor.systemOrange, name: "Orange")
        vc.modalPresentationStyle = .fullScreen
        
        present(vc,animated: true)
    }
    
    @IBSegueAction func showBlue(_ coder: NSCoder) -> Color2ViewController? {
        guard let vc =  Color2ViewController(coder: coder) else{
           return nil
        }
        vc.set(color: UIColor.blue, name: "Blue")
        
        return vc
    }
}

