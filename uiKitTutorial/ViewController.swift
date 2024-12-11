//
//  ViewController.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 20/11/24.
//

import UIKit

class ViewController: UIViewController {
    // empty project
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        
    }
    
    @IBAction func randomImage(_ sender: Any) {
        let url = URL(string: "https://loremflickr.com/2000/2000")!
        let task = URLSession.shared.downloadTask(with: url){
            (localURL, response,error) in
            
            let data = try! Data(contentsOf: url)
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        task.resume()
    }
}

