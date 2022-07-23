//
//  NetworkService.swift
//  MarvelAPITestTask
//
//  Created by Egor Vedeneev on 21.07.2022.
//

import Foundation
import Alamofire

protocol JSONResponseDelegate {
    func passResults(_ results: MarvelJSON)
}

final class NetworkService {
    
    static let shared = NetworkService()
    
    private let url = URL(string: "https://gateway.marvel.com/v1/public/characters")
    private let publicKey = "b55ff54838efe3a5a38e2b443b9880bd"
    private let privateKey = "3a1cad95f793d7dfe4a56c7a0d13a132f56a1339"
    private let ts = Date().timeStamp
    private let queue = DispatchQueue(label: "networkQueue", qos: .utility, attributes: .concurrent)
    
    var delegate: JSONResponseDelegate?
    
    private init(){}
    
    private func createHash() -> String {
        let hash = "\(ts + privateKey + publicKey)"
        let md5Hash = hash.md5
        return md5Hash
    }
    
    public func getCharacter() {
        let hash = createHash()
        let parameters = [
            "limit": "\(100)",
            "ts" : "\(ts)",
            "apikey" : "\(publicKey)",
            "hash" : "\(hash)",
        ]
        queue.async { [weak self] in
            guard let url = self?.url else { return }

            AF.request(url, method: .get, parameters: parameters)
                .validate()
                .response { response in
                    switch response.result {
                        case .failure:
                            print("_____-----Error-----_____")
                        case .success:
                            guard let data = response.data else { return }
                            let decoder = JSONDecoder()
                            let results = try! decoder.decode(MarvelJSON.self, from: data)
                            self?.delegate?.passResults(results)
                    }
                }
        }
    }
}
