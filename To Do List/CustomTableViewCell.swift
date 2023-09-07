//
//  CustomTableViewCell.swift
//  To Do List
//
//  Created by Vlad Klunduk on 07/09/2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    /*let checkBox: CheckboxButton = {
        let box = CheckboxButton()
        box.translatesAutoresizingMaskIntoConstraints = false
        retu
    }()
    */
    
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
        addSubview(descriptionLabel)
        addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 3),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            dateLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
        ])
    }
}
