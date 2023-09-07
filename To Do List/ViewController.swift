//
//  ViewController.swift
//  To Do List
//
//  Created by Vlad Klunduk on 07/09/2023.
//

import UIKit

class ViewController: UITableViewController {
    
    var list = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To Do List"
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        list.append(Task(text: "kasdjcn", date: Date.now, isDone: false))
        list.append(Task(text: "kasdjcn", date: Date.now, isDone: false))
        list.append(Task(text: "kasdjcn", date: Date.now, isDone: false))
        list.append(Task(text: "kasdjcn", date: Date.now, isDone: false))
        list.append(Task(text: "kasdjcn", date: Date.now, isDone: false))
        
        tableView.rowHeight = 64
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.descriptionLabel.text = list[indexPath.row].text
        cell.dateLabel.text = list[indexPath.row].date.formatted()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func addTask() {
        let task = UINavigationController(rootViewController: TaskViewController())
        task.modalPresentationStyle = .formSheet
        present(task, animated: true)
    }
}

