//
//  CardViewController.swift
//  MarvelAPITestTask
//
//  Created by Egor Vedeneev on 22.07.2022.
//

import UIKit

class CardViewController: UIViewController {
    
    var cardView = CharacterCardView()
    
    init(_ charterId: Result) {
        super.init(nibName: nil, bundle: nil)
        loadInfo("\(charterId.thumbnail.path as String).jpg", "\(charterId.name)", "\(charterId.description ?? "Description not available")")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = cardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    func loadInfo(_ url: String, _ name: String, _ description: String) {
        cardView.characterImageView.download(from: URL(string: url)!, contentMode: .scaleAspectFill)
        cardView.nameLabel.text = name
        cardView.descriptionLabel.text = description
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.topAnchor),
            cardView.leftAnchor.constraint(equalTo: view.leftAnchor),
            cardView.rightAnchor.constraint(equalTo: view.rightAnchor),
            cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
