//
//  InfoConfiguration.swift
//  Yes24Ticket
//
//  Created by 송여경 on 11/26/24.
//

import UIKit

struct InfoConfiguration {
    
    let title: String
    let details: String
    var isExpanded: Bool?
    
}

extension InfoConfiguration {
    
    static var mockData: [InfoConfiguration] = [
        .init(
            title: "알립니다",
            details: "※ 본 공연은 네이버 쿠폰이 적용되지 않습니다.\n※ 본 공연은 YES24공연에서 진행하는 할인쿠폰이벤트 대상에서 제외됩니다.\n※ 매수제한: 공연별 1인 4매",
            isExpanded: false
        ),
        .init(
            title: "상세정보",
            details: ""
        ),
        .init(
            title: "할인정보",
            details: ""
        ),
        .init(
            title: "기대평",
            details: ""
        ),
        .init(
            title: "공연 이미지(1)",
            details: ""
        )
    ]
    
}

