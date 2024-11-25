//
//  WhatsHotTicketsDTO.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/25/24.
//

struct WhatsHotTicketsDTO: Decodable {
    
    let result: String
    let datas: [WhatsHotTicketDTO]
    
}

struct WhatsHotTicketDTO: Decodable {
    
    let ticketID: Int
    let ticketTitle, ticketArea, ticketDate, comment: String
    let imgURL: String

    enum CodingKeys: String, CodingKey {
        
        case ticketID = "ticket_id"
        case ticketTitle = "ticket_title"
        case ticketArea = "ticket_area"
        case ticketDate = "ticket_date"
        case comment
        case imgURL = "img_url"
        
    }
    
}
