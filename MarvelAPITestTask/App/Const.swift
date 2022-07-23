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
    }
    
    enum LabelLines: Int {
        case notLimited = 0
    }
    
    enum Space: CGFloat {
        case smallSpace = 10
        case mediumSpace = 20
        case largeSpace = 40
    }
}
