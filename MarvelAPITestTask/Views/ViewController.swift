//
//  ViewController.swift
//  MarvelAPITestTask
//
//  Created by Egor Vedeneev on 21.07.2022.
//

import UIKit


class ViewController: UIViewController {

    var results: MarvelJSON?
    
    var listCharacterView = ListCharactersView()
    
    var loadingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = .white.withAlphaComponent(0.8)
        return view
    }()
    
    var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .large
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = listCharacterView
        view.addSubview(loadingView)
        loadingView.addSubview(indicator)
        
        
        setupConstraints()
        listCharacterView.tableView.dataSource = self
        listCharacterView.tableView.delegate = self
        listCharacterView.tableView.register(CharacterTableViewCell.self,
                                             forCellReuseIdentifier: "CharacterTableViewCell")
        
        NetworkService.shared.delegate = self
        NetworkService.shared.getCharacter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showSpinner()
    }
    
    private func showSpinner() {
        indicator.startAnimating()
        loadingView.isHidden = false
    }

    private func hideSpinner() {
        indicator.stopAnimating()
        loadingView.isHidden = true
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            listCharacterView.topAnchor.constraint(equalTo: view.topAnchor),
            listCharacterView.leftAnchor.constraint(equalTo: view.leftAnchor),
            listCharacterView.rightAnchor.constraint(equalTo: view.rightAnchor),
            listCharacterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.heightAnchor.constraint(equalToConstant: 100),
            loadingView.widthAnchor.constraint(equalToConstant: 100),
            
            indicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = results?.data.results.count else {
            return 0
        }
        
        
        hideSpinner()
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

extension ViewController: JSONResponseDelegate {
    func passResults(_ results: MarvelJSON) {
        self.results = results
        DispatchQueue.main.async {
            self.listCharacterView.tableView.reloadData()
        }
    }
}
