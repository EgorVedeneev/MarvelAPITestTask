//
//  ListCharactersView.swift
//  MarvelAPITestTask
//
//  Created by Egor Vedeneev on 21.07.2022.
//

import UIKit

class ListCharactersView: UIView {
    
    public var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        tableView.layer.cornerRadius = 8
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
