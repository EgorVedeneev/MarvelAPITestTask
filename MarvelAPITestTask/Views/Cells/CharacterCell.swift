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
        imgView.layer.cornerRadius = Const.Corner.smallRadius.rawValue
        return imgView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Const.FontSize.cellSize.rawValue, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "CharacterTableViewCell")
        addSubview(characterImageView)
        addSubview(nameLabel)
        setupConstraints()
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
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.Space.mediumSpace.rawValue),
            characterImageView.heightAnchor.constraint(equalToConstant: Const.ImageSize.listSize.rawValue),
            characterImageView.widthAnchor.constraint(equalToConstant: Const.ImageSize.listSize.rawValue),
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: Const.Space.smallSpace.rawValue),
            characterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Const.Space.smallSpace.rawValue),
            
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: Const.Space.mediumSpace.rawValue),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Const.Space.mediumSpace.rawValue)
        ])
    }
}
