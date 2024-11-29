//
//  ConcertRequestDTO.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/29/24.
//

///tickets/list?sortBy=popular

struct ConcertRequestDTO: Encodable {
    
    let sortBy: ConcertSortCase?
    
}

enum ConcertSortCase: String, Encodable {
    
    case popular
    case ranking
    case reviews
    case endingSoon
    
}
