//
//  Color2ViewController.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 21/11/24.
//

import UIKit

class Color2ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var color: UIColor?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = color
        label.text = name
        title = name
        
    }
    
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func set(color: UIColor, name: String){
        self.color = color
        self.name = name
    }
    

}
