//
//  AdCellConfiguration.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/21/24.
//

import UIKit

struct AdCellConfiguration {
    
    let id: Int
    let image: UIImage
    
}

extension AdCellConfiguration {
    
    static let mockData: [AdCellConfiguration] = [
        .init(id: 0, image: .icSitBlue18),
        .init(id: 1, image: .icnArrayRed18I),
        .init(id: 2, image: .icnFillUpI)
    ]
    
}
