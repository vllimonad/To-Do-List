//
//  Task.swift
//  To Do List
//
//  Created by Vlad Klunduk on 07/09/2023.
//

import Foundation

class Task: Codable {
    
    let text: String
    let date: Date
    var isDone: Bool
    
    init(text: String, date: Date, isDone: Bool) {
        self.text = text
        self.date = date
        self.isDone = isDone
    }
}
