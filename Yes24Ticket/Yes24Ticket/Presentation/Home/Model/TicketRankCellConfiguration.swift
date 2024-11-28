//
//  TicketRankCellConfiguration.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/21/24.
//

import UIKit

struct TicketRankCellConfiguration {
    
    let id: Int
    let image: UIImage
    let rank: Int
    
}

extension TicketRankCellConfiguration {
    
    static let mockData: [TicketRankCellConfiguration] = [
        .init(id: 0,image: .icSitBlue18, rank: 1),
        .init(id: 1,image: .icnX18, rank: 2),
        .init(id: 2,image: .icIShare36, rank: 3),
        .init(id: 3,image: .icSitMint18, rank: 4),
        .init(id: 4,image: .icSearchGray, rank: 5),
        .init(id: 5,image: .icArrowRightBlue16, rank: 6),
        .init(id: 6,image: .logoYes24Ios, rank: 7)
    ]
    
}
