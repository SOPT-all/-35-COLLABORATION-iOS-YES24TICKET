//
//  AdCellConfiguration.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/21/24.
//

import UIKit

struct AdCellConfiguration {
    
    let image: UIImage
    
}

extension AdCellConfiguration {
    
    static let mockData: [AdCellConfiguration] = [
        .init(image: .icSitBlue18),
        .init(image: .icnArrayRed18I),
        .init(image: .icnFillUpI)
    ]
    
}
