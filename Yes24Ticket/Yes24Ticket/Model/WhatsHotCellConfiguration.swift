//
//  WhatsHotCellConfiguration.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/22/24.
//

import UIKit

struct WhatsHotCellConfiguration {
    
    let id: Int
    let title: String
    let area: String
    let date: String
    let comment: String
    let image: UIImage
    
}

extension WhatsHotCellConfiguration {
    
    static let mockData: [WhatsHotCellConfiguration] = [
        .init(
            id: 0,
            title: "이무진 전국투어 콘서트",
            area: "대구, 창원",
            date: "2024.12 - 2025.01",
            comment: "올해로 세 번째를맞이하는 이무진의 브랜드 콘서트",
            image: .icSitBlue18
        ),
        .init(
            id: 1,
            title: "타카하타 이사오",
            area: "서울",
            date: "2024.12 - 2025.01",
            comment: "스튜디오 지브리 애니메이션의 거장",
            image: .icSitMint18
        ),
        .init(
            id: 2,
            title: "이무진 전국투어 콘서트",
            area: "대구, 창원",
            date: "2024.12 - 2025.01",
            comment: "올해로 세 번째를맞이하는 이무진의 브랜드 콘서트",
            image: .icSitBlue18
        )
    ]
    
}
