//
//  TodoViewController.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 21/11/24.
//

import UIKit

protocol TodoViewControllerDelegate: AnyObject{
    func todoViewController(_ vc: TodoViewController, didSaveTodo todo:Todo)
}

class TodoViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var todo: Todo?
    
    weak var delegate: TodoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = todo?.title
    }
    
    @IBAction func save(_ sender: Any) {
        let todo = Todo(title: textField.text!)
        delegate?.todoViewController(self, didSaveTodo: todo)
    }
   
}

