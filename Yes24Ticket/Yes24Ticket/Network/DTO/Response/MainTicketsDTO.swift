//
//  MainTicketsDTO.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/25/24.
//

struct MainTicketsDTO: Decodable {
    
    let result: String
    let datas: [MainTicketDTO]
    
}

struct MainTicketDTO: Decodable {
    
    let ticketID: Int
    let title, area: String
    let img: String
    let period: String

    enum CodingKeys: String, CodingKey {
        
        case ticketID = "ticketId"
        case title, area, img, period
        
    }
    
}
