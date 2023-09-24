//
//  TaskViewController.swift
//  To Do List
//
//  Created by Vlad Klunduk on 07/09/2023.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    var delegate: TaskViewControllerDelegate?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "New Task"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let panelView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let textField: UITextField = {
        let field = UITextField()
        field.placeholder = "Title"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray2
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(panelView)
        panelView.addSubview(stackView)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(datePicker)
        stackView.addArrangedSubview(saveButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 60),
            
            panelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            panelView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 150),
            panelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            panelView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -150),
            
            stackView.leadingAnchor.constraint(equalTo: panelView.leadingAnchor, constant: 20),
            stackView.topAnchor.constraint(equalTo: panelView.topAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: panelView.trailingAnchor, constant: -20)
            
        ])
    }
    
    @objc func save() {
        guard let text = textField.text else { return }
        let date = datePicker.date
        var task = Task(text: text, date: date, isDone: false)
        delegate!.addTaskToList(task)
        dismiss(animated: true)
    }

}

protocol TaskViewControllerDelegate{
    func addTaskToList(_ task: Task)
}
