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
    
    init(text: String, date: Date) {
        self.text = text
        self.date = date
    }
}
