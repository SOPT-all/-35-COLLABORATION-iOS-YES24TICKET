//
//  CategoryCellConfiguration.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/20/24.
//

struct CategoryCellConfiguration {
    
    let title: String
    
}

extension CategoryCellConfiguration {
    
    static let mockData: [CategoryCellConfiguration] = [
        .init(title: "콘서트"),
        .init(title: "뮤지컬"),
        .init(title: "연극"),
        .init(title: "클래식/무용"),
        .init(title: "전시/행사"),
        .init(title: "가족/어린이")
    ]
    
}
