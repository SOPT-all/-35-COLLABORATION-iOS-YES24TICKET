//
//  RemainTicketsDTO.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/29/24.
//

struct RemainTicketsDTO: Decodable {
    
    let result, concertID: String
    let data: [RemainTicketDTO]

    enum CodingKeys: String, CodingKey {
        
        case result
        case concertID = "concert_id"
        case data
        
    }
    
}

struct RemainTicketDTO: Decodable {
    
    let performanceTime: String
    let remainingSeats: [RemainingSeatDTO]

    enum CodingKeys: String, CodingKey {
        
        case performanceTime = "performance_time"
        case remainingSeats = "remaining_seats"
        
    }
    
}

struct RemainingSeatDTO: Decodable {
    
    let type, remaining: String
    
}
