//
//  CheckTableTableViewCell.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 20/11/24.
//

import UIKit

protocol CheckTableViewCellDelegate: AnyObject{
    func checkTableViewCell(_ cell: CheckTableViewCell,
                            didChangeCheckedState checked: Bool)
}

class CheckTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var checkbox: CheckBox!
    
    weak var delegate: CheckTableViewCellDelegate?
    
    @IBAction func checked(_ sender: CheckBox) {
        updateChecked()
        delegate?.checkTableViewCell(self, didChangeCheckedState: checkbox.checked)
    }
    
    func set(title: String, checked: Bool){
        label.text=title 
        set(checked: checked)
    }
    
    func set(checked: Bool){
        checkbox.checked = checked
        updateChecked ()
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
