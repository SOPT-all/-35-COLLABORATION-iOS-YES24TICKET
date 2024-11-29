//
//  AvailableDateDTO.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/29/24.
//


struct AvailableDateDTO: Codable {
    
    let result, concertID: String
    let performanceTimes: [String]

    enum CodingKeys: String, CodingKey {
        case result
        case concertID = "concert_id"
        case performanceTimes = "performance_times"
    }
    
}
