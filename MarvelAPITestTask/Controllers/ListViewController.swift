//
//  ViewController.swift
//  MarvelAPITestTask
//
//  Created by Egor Vedeneev on 21.07.2022.
//

import UIKit


class ListViewController: UIViewController {

    var results: MarvelJSON?
    
    var listCharacterView = ListCharactersView()
    var indicator2 = IndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = listCharacterView
        view.addSubview(indicator2)
        
        setupConstraints()
        listCharacterView.tableView.dataSource = self
        listCharacterView.tableView.delegate = self
        listCharacterView.tableView.register(CharacterTableViewCell.self,
                                             forCellReuseIdentifier: "CharacterTableViewCell")
        NetworkService.shared.delegate = self
        NetworkService.shared.getCharacter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        indicator2.show()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            listCharacterView.topAnchor.constraint(equalTo: view.topAnchor),
            listCharacterView.leftAnchor.constraint(equalTo: view.leftAnchor),
            listCharacterView.rightAnchor.constraint(equalTo: view.rightAnchor),
            listCharacterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            indicator2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = results?.data.results.count else {
            return 0
        }
        
        indicator2.hide()
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell",
                                                 for: indexPath) as! CharacterTableViewCell
        guard let results = results else { return cell }
        let path = results.data.results[indexPath.item].thumbnail.path.description
        let url = "\(path as String).jpg".replacingOccurrences(of: "http", with: "https")
        let name = "\(results.data.results[indexPath.item].name)"
        cell.fillCell(url, name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let results = results else {return}
        present(CardViewController(results.data.results[indexPath.item]), animated: true)
    }
}

extension ListViewController: JSONResponseDelegate {
    func passResults(_ results: MarvelJSON) {
        self.results = results
        DispatchQueue.main.async {
            self.listCharacterView.tableView.reloadData()
        }
    }
}
