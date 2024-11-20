//
//  ViewController.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 20/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelCenterContraint: NSLayoutConstraint!
    @IBOutlet weak var labelTopContraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let button = UIButton(type: .system)
        button.setTitle("Push Me", for: .normal)
        button.addTarget(self, action: #selector(buttonPushed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        let leftContraint = button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor) // left
        leftContraint.isActive = true
        
        let rightContraint = button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor) // right
        rightContraint.isActive = true
        
        let bottomContraint = button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        bottomContraint.isActive = true
        
    }
    @objc func buttonPushed(_ button: UIButton){
        // labelCenterContraint.constant = -(view.frame.size.height/2 + 100)
        if labelCenterContraint.isActive == true {
            labelCenterContraint.isActive = false
            labelTopContraint.isActive = true
        } else {
            labelCenterContraint.isActive = true
            labelTopContraint.isActive = false
        }
        
    }

}

