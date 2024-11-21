//
//  CheckTableTableViewCell.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 20/11/24.
//

import UIKit

class CheckTableViewCell: UITableViewCell {


    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var checkbox: CheckBox!
    
    
    @IBAction func checked(_ sender: CheckBox) {
        updateChecked()
    }
    
    func set(title: String, checked: Bool){
        label.text=title 
        checkbox.checked = checked
        updateChecked()
    }
    
    private func updateChecked() {
        
        guard let labelText = label.text else {
             print("Label text is nil!")
             return
         }
        
        let attributedString = NSMutableAttributedString(string: labelText)
        
        if checkbox.checked {
            attributedString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length - 1))
        } else {
            attributedString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributedString.length - 1 ))
        }
        
        label.attributedText = attributedString
    }

}
