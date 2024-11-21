//
//  Todo.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 20/11/24.
//

import Foundation

struct Todo{
    let title: String
    let isComplete: Bool
    
    init(title: String, isComplete: Bool = false) {
        self.title = title
        self.isComplete = isComplete
    }
    
}
