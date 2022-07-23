//
//  CharacterCardView.swift
//  MarvelAPITestTask
//
//  Created by Egor Vedeneev on 21.07.2022.
//

import Foundation
import UIKit

class CharacterCardView: UIView {
    
    var characterImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.masksToBounds = true
        return imgView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Const.FontSize.cardSize.rawValue, weight: .bold)
        label.numberOfLines = Const.LabelLines.notLimited.rawValue
        label.textAlignment = .center
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = Const.LabelLines.notLimited.rawValue
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = Const.Corner.smallRadius.rawValue
        addSubview(characterImageView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterImageView.heightAnchor.constraint(equalTo: widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: Const.Space.smallSpace.rawValue),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.Space.largeSpace.rawValue),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Const.Space.largeSpace.rawValue),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Const.Space.mediumSpace.rawValue),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.Space.mediumSpace.rawValue),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Const.Space.mediumSpace.rawValue),
        ])
    }
}
