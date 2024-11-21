//
//  Concert.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/20/24.
//

import UIKit

struct Concert {
    
    let image: UIImage
    let title: String
    let genre: String
    let date: String
    let area: String
    let age: String
    let duration: String
    let hypertext: String
    let hyperlink: String
    let notice: [String]
    let performenceTime: [String]
    let pricing: [Ticket]
    
}

struct Ticket {
    
    let type: String
    let price: String
    let color: Int
    
    static let mockPricing : [Ticket] = [
        Ticket(
            type: "R석",
            price: "88.000 원",
            color: 2
        ),
        Ticket(
            type: "S석",
            price: "77,000원",
            color: 3
        )
    ]
    
}

extension Concert {
    
    static let mockData: Self = .init (
        image: .icSitBlue18,
        title: "HYPE UP FESTIVAL",
        genre: "콘서트",
        date: "2024.11.10 ~ 2024.11.10",
        area: "YES24 LIVE HALL",
        age: "7세 이상",
        duration: "총 180분",
        hypertext: "HYPE UP FESTIVAL 바로가기",
        hyperlink: "https://www.hypefestival.de/",
        notice: [
            "※ 본 공연은 네이버 쿠폰이 적용되지 않습니다.",
            "※ 본 공연은 YES74공연에서 진행하는 할인쿠폰이벤트 대상에서 제외됩니다.",
            "※ 매수제한: 공연별 1인 4매"
        ],
        performenceTime: [
            "2024-11-20 (수) 13:00",
            "2024-11-21 (목) 15:00",
            "2024-11-22 (금) 14:00",
            "2024-11-23 (금) 15:00"
        ],
        pricing: Ticket.mockPricing
    )
    
}

