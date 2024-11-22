//
//  ColorViewController.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 21/11/24.
//

import UIKit

class ColorViewController: UIViewController {

    var label: UILabel!
    var color: UIColor?
    var name: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color
        
        label = UILabel()
        label.text = name
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        button.setTitle("Done", for: .normal)
        
        button.addTarget(self, action: #selector(done), for: .touchUpInside)
        
    }
    @objc func done(){
        dismiss(animated: true)
    }
    
    
    func set(color: UIColor, name:String){
        self.color = color
        self.name = name
    }
}
