//
//  ViewController.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 20/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    var todos = [
        Todo(title: "Make a vanilla pudding"),
        Todo(title: "Put pudding in a mayo jarl"),
        Todo(title: "Eat in a public place"),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func startEditing(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    
    @IBSegueAction func todoViewController(_ coder: NSCoder) -> TodoViewController? {
        let vc = TodoViewController(coder: coder)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            let todo = todos[indexPath.row]
            vc?.todo = todo
        }
        vc?.delegate = self
        vc?.presentationController?.delegate = self
        
        return vc
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .normal, title: "Complete") {
            action,view,complete in
            
            // create new todo selected with same title
            let todo = self.todos[indexPath.row].completeToogled()
            self.todos[indexPath.row] = todo
            
            let cell = tableView.cellForRow(at: indexPath) as! CheckTableViewCell
            cell.set(checked:todo.isComplete)
                     
            complete(true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkedCell", for: indexPath) as! CheckTableViewCell
        
        cell.delegate = self
        
        let todo = todos[indexPath.row]
        
        cell.set(title: todo.title, checked: todo.isComplete)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = todos.remove(at: sourceIndexPath.row)
        todos.insert(todo, at: destinationIndexPath.row)
    }
    
}
extension ViewController: CheckTableViewCellDelegate{
    func checkTableViewCell(_ cell: CheckTableViewCell, didChangeCheckedState checked: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        let todo = todos[indexPath.row]
        
        let newTodo = Todo(title: todo.title, isComplete: checked)
        
        todos[indexPath.row] = newTodo
        
    }
}

extension ViewController: TodoViewControllerDelegate{
    
    func todoViewController(_ vc: TodoViewController, didSaveTodo todo: Todo) {
        
        dismiss(animated: true){
            if let indexPath = self.tableView.indexPathForSelectedRow{
                self.todos[indexPath.row] = todo
                self.tableView.reloadRows(at: [indexPath], with: .none)
            } else {
                self.todos.append(todo)
                self.tableView.insertRows(at: [IndexPath(row: self.todos.count-1, section: 0)], with: .automatic)
            }
        }
    }
}
extension ViewController: UIAdaptivePresentationControllerDelegate{
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        if let IndexPath = tableView.indexPathForSelectedRow{
            tableView.deselectRow(at: IndexPath, animated: true)
        }
    }
}
