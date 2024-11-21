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
        
        
        
    }


    @IBAction func checkChanged(_ sender: CheckBox) {
        print("Checkbox \(sender.checked ? "Checked":"Unchecked")")
    }
}

