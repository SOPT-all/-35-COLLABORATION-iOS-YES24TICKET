//
//  TicketDetailDTO.swift
//  Yes24Ticket
//
//  Created by 조성민 on 11/30/24.
//

struct TicketDetailDTO: Decodable {
    
    let result: String
    let concert: ConcertDetailDTO
    
}

struct ConcertDetailDTO: Decodable {
    
    let concertID, concertTitle, concertArea: String
    let concertImg: String
    let concertDate, concertDuration, concertAge, numberOfLikes: String
    let like, hypertext: String
    let hyperlink: String
    let notice, performanceTimes: [String]
    let ticketPricing: [TicketPricingDTO]

    enum CodingKeys: String, CodingKey {
        
        case concertID = "concert_id"
        case concertTitle = "concert_title"
        case concertArea = "concert_area"
        case concertImg = "concert_img"
        case concertDate = "concert_date"
        case concertDuration = "concert_duration"
        case concertAge = "concert_age"
        case numberOfLikes = "number_of_likes"
        case like, hypertext, hyperlink, notice
        case performanceTimes = "performance_times"
        case ticketPricing = "ticket_pricing"
        
    }
    
}

struct TicketPricingDTO: Decodable {
    
    let type, price, color: String
    
}
