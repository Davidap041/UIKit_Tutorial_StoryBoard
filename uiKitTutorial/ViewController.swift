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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        
    }
    
    @IBAction func randomQuote(_ sender: Any) {
        let url = URL(string: "https://api.kanye.rest/")!
        
        let task = URLSession.shared.dataTask(with: url) {
            // task completed with error or not
            (data: Data?, response: URLResponse?,error: Error?) in
            if let error = error {
                print("Error: ", error)
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data!,options: []) as! [String: String]
            
            DispatchQueue.main.async{
                self.label.text = json["quote"]
            }
        }
        task.resume()
    }
    
}

