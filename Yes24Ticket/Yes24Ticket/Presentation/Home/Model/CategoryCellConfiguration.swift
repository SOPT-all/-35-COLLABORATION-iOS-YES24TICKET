//
//  CategoryCellConfiguration.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/20/24.
//

struct CategoryCellConfiguration {
    
    let id: Int
    let title: String
    
}

extension CategoryCellConfiguration {
    
    static let mockData: [CategoryCellConfiguration] = [
        .init(id: 0, title: "콘서트"),
        .init(id: 1, title: "뮤지컬"),
        .init(id: 2, title: "연극"),
        .init(id: 3, title: "클래식/무용"),
        .init(id: 4, title: "전시/행사"),
        .init(id: 5, title: "가족/어린이")
    ]
    
}
