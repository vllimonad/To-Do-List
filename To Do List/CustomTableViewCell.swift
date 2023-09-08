//
//  CustomTableViewCell.swift
//  To Do List
//
//  Created by Vlad Klunduk on 07/09/2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let checkBox: UIImageView = {
        let box = UIImageView()
        box.translatesAutoresizingMaskIntoConstraints = false
        return box
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(checkBox)
        addSubview(descriptionLabel)
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            checkBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            checkBox.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -5),
            descriptionLabel.leadingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: 40),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: checkBox.leadingAnchor, constant: 40),
            dateLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
        ])
    }
}
