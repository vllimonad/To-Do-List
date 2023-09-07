//
//  TaskViewController.swift
//  To Do List
//
//  Created by Vlad Klunduk on 07/09/2023.
//

import UIKit

class TaskViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Add Task"

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(save))
    }

    
    @objc func cancel() {
        dismiss(animated: true)
    }
    
    @objc func save() {
        
    }

}
