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
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openTaskForm))
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 60
        readList()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let con = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular)
        cell.checkBox.image = UIImage(systemName: list[indexPath.row].isDone ? "checkmark.circle" : "circle", withConfiguration: con)
        cell.descriptionLabel.text = list[indexPath.row].text
        cell.dateLabel.text = formatter.string(from: list[indexPath.row].date)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        list[indexPath.row].isDone.toggle()
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadRows(at: [indexPath], with: .automatic)
        saveList()
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swap = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: { [weak self] _,_,_  in
            self?.list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        })])
        saveList()
        return swap
    }
    
    @objc func openTaskForm() {
        let task = TaskViewController()
        task.delegate = self
        task.modalPresentationStyle = .formSheet
        present(task, animated: true)
    }
    
    func readList() {
        let defaults = UserDefaults.standard
        if let data = defaults.object(forKey: "tasks") as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                list = try jsonDecoder.decode([Task].self, from: data)
            } catch {
                print("reading error")
            }
        }
    }
    
    func saveList() {
        let jsonEncoder = JSONEncoder()
        if let data = try? jsonEncoder.encode(list) {
            let defaults = UserDefaults.standard
            defaults.set(data, forKey: "tasks")
        }
    }
}


extension ViewController: NewTask {
    func addTaskToList(_ task: Task) {
        list.append(task)
        tableView.reloadData()
        saveList()
    }
}
