//
//  ViewController.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 20/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    let todos = [
        Todo(title: "Make a vanilla pudding"),
        Todo(title: "Put pudding in a mayo jarl"),
        Todo(title: "Eat in a public place"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
}

extension ViewController: UITableViewDataSource {
 
    /* define number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     */
    
    // define number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    // define cells 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // print(indexPath)
        
        let todo = todos[indexPath.row]
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = todo.title
        return cell
    }
    
    
    
    
}
