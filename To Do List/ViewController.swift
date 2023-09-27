//
//  ViewController.swift
//  To Do List
//
//  Created by Vlad Klunduk on 07/09/2023.
//

import UIKit

class ViewController: UITableViewController {
    
    var list = [Task]()
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    let configuration = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular)

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
        cell.checkBox.image = UIImage(systemName: list[indexPath.row].isDone ? "checkmark.circle" : "circle", withConfiguration: configuration)
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
        let task = NewTaskViewController()
        task.delegate = self
        task.modalPresentationStyle = .formSheet
        present(task, animated: true)
    }
    
    func readList() {
        if let data = try? Data(contentsOf: getLocation()) {
            do {
                list = try JSONDecoder().decode([Task].self, from: data)
            } catch {
                print("reading error")
            }
        }
    }
    
    func saveList() {
        if let data = try? JSONEncoder().encode(list) {
            try? data.write(to: getLocation())
        }
    }
    
    func getLocation() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appending(path: "tasks.txt")
    }
}


extension ViewController: TaskViewControllerDelegate {
    func addTaskToList(_ task: Task) {
        list.append(task)
        list.sort(by: { $0.date > $1.date })
        tableView.reloadData()
        saveList()
    }
}
