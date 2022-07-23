//
//  CharacterCell.swift
//  MarvelAPITestTask
//
//  Created by Egor Vedeneev on 21.07.2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    private var characterImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 6
        return imgView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "CharacterTableViewCell")
        addSubview(characterImageView)
        addSubview(nameLabel)
        setupConstraints()
        layer.masksToBounds = true
        layer.cornerRadius = 8
        contentView.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func fillCell(_ imageUrl: String, _ name: String) {
        characterImageView.download(from: URL(string: imageUrl)!, contentMode: .scaleAspectFill)
        nameLabel.text = name
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            characterImageView.heightAnchor.constraint(equalToConstant: 75),
            characterImageView.widthAnchor.constraint(equalToConstant: 75),
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            characterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 30),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
