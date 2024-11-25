//
//  MainCellConfiguration.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/19/24.
//

import UIKit

struct MainCellConfiguration {
    
    let id: Int
    let title: String
    let area: String
    let date: String
    let image: UIImage
    
}

extension MainCellConfiguration {
    
    static var mockData: [MainCellConfiguration] = [
        .init(
            id: 0,
            title: "뮤지컬 시지프스1",
            area: "예스24스테이지 1관",
            date: "2024.12 - 2025.01",
            image: .logoYes24Ios
        ),
        .init(
            id: 1,
            title: "뮤지컬 시지프스2",
            area: "예스24스테이지 2관",
            date: "2024.12 - 2025.02",
            image: .icSitBlue18
        ),
        .init(
            id: 2,
            title: "뮤지컬 시지프스3",
            area: "예스24스테이지 3관",
            date: "2024.12 - 2025.03",
            image: .icSitMint18
        )
    ]
    
}
