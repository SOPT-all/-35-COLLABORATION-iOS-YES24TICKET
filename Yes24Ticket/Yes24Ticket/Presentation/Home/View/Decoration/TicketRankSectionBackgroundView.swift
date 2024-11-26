//
//  TicketRankSectionBackgroundView.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/21/24.
//

import UIKit

final class TicketRankSectionBackgroundView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        backgroundColor = .white0
        addBorders(
            edges: [
                .top,
                .bottom
            ],
            color: .gray150,
            width: 1
        )
    }
    
}
