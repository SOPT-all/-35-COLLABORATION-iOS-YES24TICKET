//
//  RequestRemainTicketsDTO.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/29/24.
//


struct RequestRemainTicketsDTO: Encodable {
    
    let concertID, performanceTime: String

    enum CodingKeys: String, CodingKey {
        
        case concertID = "concert_id"
        case performanceTime = "performance_time"
        
    }
    
}
