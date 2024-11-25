//
//  RankListDTO.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/25/24.
//

struct RankListDTO: Decodable {
    
    let result: String
    let ranking: [RankDTO]
    
}

struct RankDTO: Decodable {
    
    let rank, ticketID: Int
    let imgURL: String

    enum CodingKeys: String, CodingKey {
        
        case rank
        case ticketID = "ticket_id"
        case imgURL = "img_url"
        
    }
    
}
