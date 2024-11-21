//
//  TicketRankCellConfiguration.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/21/24.
//

import UIKit

struct TicketRankCellConfiguration {
    
    let image: UIImage
    let rank: Int
    
}

extension TicketRankCellConfiguration {
    
    static let mockData: [TicketRankCellConfiguration] = [
        .init(image: .icSitBlue18, rank: 1),
        .init(image: .icnX18, rank: 2),
        .init(image: .icIShare36, rank: 3),
        .init(image: .icSitMint18, rank: 4),
        .init(image: .icSearchGray, rank: 5),
        .init(image: .icArrowRightBlue16, rank: 6),
        .init(image: .logoYes24Ios, rank: 7)
    ]
    
}
