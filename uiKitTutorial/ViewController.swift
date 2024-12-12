//
//  ViewController.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 20/11/24.
//

import UIKit

class ViewController: UIViewController {
    // empty project
    @IBOutlet weak var label: UILabel!
    let network = Networker()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        
    }
    
    @IBAction func randomQuote(_ sender: Any) {
        network.getQuote { kanye, error in
            if let error = error {
                self.label.text = error.localizedDescription.description
                return
            }
            self.label.text = kanye?.quote
            
        }
    }
}

