//
//  ConcertsDTO.swift
//  Yes24Ticket
//
//  Created by 어진 on 11/29/24.
//

struct ConcertsDTO: Decodable {
    
    let result: String
    let concerts: [ConcertDTO]
    
}

struct ConcertDTO: Decodable {
    
    let concertID: Int
    let concertTitle, concertDate, concertArea: String
    let concertImg: String

    enum CodingKeys: String, CodingKey {
        case concertID = "concert_id"
        case concertTitle = "concert_title"
        case concertDate = "concert_date"
        case concertArea = "concert_area"
        case concertImg = "concert_img"
    }
    
}
