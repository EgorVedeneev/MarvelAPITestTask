//
//  Const.swift
//  MarvelAPITestTask
//
//  Created by Egor Vedeneev on 23.07.2022.
//

import Foundation
import UIKit

class Const {
    
    enum Corner: CGFloat {
        case smallRadius = 6
        case bigRadius = 8
    }
    
    enum FontSize: CGFloat {
        case cellSize = 20
        case cardSize = 24
    }
    
    enum ImageSize: CGFloat {
        case listSize = 75
        case indicator = 100
    }
    
    enum LabelLines: Int {
        case notLimited = 0
    }
    
    enum Space: CGFloat {
        case smallSpace = 10
        case mediumSpace = 20
        case largeSpace = 40
    }
    
    enum Alpha: CGFloat {
        case indicator = 0.8
    }
    
    enum ApiURL: String  {
        case urlString = "https://gateway.marvel.com/v1/public/characters"
    }
    
    enum ApiKeys: String {
        case publicKey = "b55ff54838efe3a5a38e2b443b9880bd"
        case privateKey = "3a1cad95f793d7dfe4a56c7a0d13a132f56a1339"
    }
}
